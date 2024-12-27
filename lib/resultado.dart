import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;
  const Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 11) {
      return '1/3';
    } else if (pontuacao < 21) {
      return '2/3';
    } else
      return 'Impressionante';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(fraseResultado, style: TextStyle(fontSize: 28)),
        ),
        ElevatedButton(
          child: Text(
            'Reiniciar?',
            style: TextStyle(color: Colors.blue, fontSize: 18),
          ),
          onPressed: quandoReiniciarQuestionario,
        )
      ],
    );
  }
}
