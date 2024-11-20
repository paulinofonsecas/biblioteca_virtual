import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/core/util/messages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: one_member_abstracts
abstract class IGestaoRelatorioRepository {
  Future<List<Map<String, dynamic>>> pegarListaUsuario();
}

class GestaoRelatorioRepository implements IGestaoRelatorioRepository {
  @override
  Future<List<Map<String, dynamic>>> pegarListaUsuario() async {
    final firestore = getIt<FirebaseFirestore>();
    final res = await firestore.collection('users').get();
    return res.docs.map((cada) => cada.data()).toList();
  }
}
