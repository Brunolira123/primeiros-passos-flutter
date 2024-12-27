import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  final String perguntas;

  const Questao(this.perguntas, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        perguntas,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
