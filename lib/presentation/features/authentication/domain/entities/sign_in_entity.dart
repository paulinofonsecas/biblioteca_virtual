import 'package:equatable/equatable.dart';

class SignInEntity extends Equatable {
  const SignInEntity({required this.password, required this.email});
  final String email;
  final String password;

  @override
  List<Object?> get props => [password, email];
}
