import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/core/error/exceptions.dart';
import 'package:bilioteca_virtual/presentation/authentication/data/models/sign_in_model.dart';
import 'package:bilioteca_virtual/presentation/authentication/data/models/sign_up_model.dart';
import 'package:bilioteca_virtual/presentation/authentication/domain/entities/my_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthRemoteDataSource {
  Future<UserCredential> signUp(SignUpModel signUp);
  Future<MyUser> signIn(SignInModel signIn);
  Future<UserCredential> googleAuthentication();

  Future<Unit> verifyEmail();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<MyUser> signIn(SignInModel signIn) async {
    try {
      final firebaseInstance = FirebaseAuth.instance;
      final firestore = getIt<FirebaseFirestore>();

      final credential = await firebaseInstance.signInWithEmailAndPassword(
        email: signIn.email,
        password: signIn.password,
      );

      final role = await firestore
          .collection('users')
          .doc(credential.user?.uid)
          .get()
          .then((data) {
        return data['role'] as String;
      });

      return MyUser(credential: credential, role: role);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw ExistedAccountException();
      } else if (e.code == 'wrong-password') {
        throw WrongPasswordException();
      } else {
        throw ServerException();
      }
    }
  }

  @override
  Future<UserCredential> signUp(SignUpModel signUp) async {
    try {
      final firebaseInstance = FirebaseAuth.instance;
      final firestore = getIt<FirebaseFirestore>();
      // await firebaseInstance.currentUser?.reload();
      final credenciais = await firebaseInstance.createUserWithEmailAndPassword(
        email: signUp.email,
        password: signUp.password,
      );
      await firestore
          .collection('users')
          .doc(credenciais.user?.uid)
          .set({'role': 'usuario'});

      return credenciais;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw WeekPassException();
      } else if (e.code == 'email-already-in-use') {
        throw ExistedAccountException();
      } else {
        throw ServerException();
      }
    }
  }

  @override
  Future<Unit> verifyEmail() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        await user.reload();
        await user.sendEmailVerification();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'too-many-requests') {
          throw TooManyRequestsException();
        } else {
          throw ServerException();
        }
      } catch (e) {
        throw ServerException();
      }
    } else {
      throw NoUserException();
    }
    return Future.value(unit);
  }

  @override
  Future<UserCredential> googleAuthentication() async {
    final firebaseInstance = FirebaseAuth.instance;
    await firebaseInstance.currentUser?.reload();
    // Trigger the authentication flow
    final googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    final googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    try {
      return await firebaseInstance.signInWithCredential(credential);
    } catch (e) {
      throw ServerException();
    }
  }
}
