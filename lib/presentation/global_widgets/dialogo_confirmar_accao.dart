import 'package:flutter/material.dart';

Future<dynamic> mostrarDialogoConfirmarAccao(
    {required BuildContext context,
    required String mensagem,
    required Function accaoAoConfirmar}) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (c) {
        return AlertDialog(content: Container(
          height: 100,
          child: Column(children: [
            const SizedBox(height: 20),
            Text(mensagem),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: const Text('Cancelar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Confirmar'),
                  onPressed: () {
                    accaoAoConfirmar();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],),
        ),);
      });
}