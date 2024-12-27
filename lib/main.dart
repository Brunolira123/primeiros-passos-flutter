import 'package:flutter/material.dart';
import 'package:projeto_perguntas/resultado.dart';
import './questionario.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  final _perguntas = const [
    {
      'texto': 'Qual primeiro livro da biblia?',
      'respostas': [
        {'texto': 'Exodo', 'pontuacao': 5},
        {'texto': 'Rute', 'pontuacao': 0},
        {'texto': 'Apocalipse', 'pontuacao': 0},
        {'texto': 'Genesis', 'pontuacao': 10},
      ],
    },
    {
      'texto': 'Qual animal não entrou na Arca?',
      'respostas': [
        {'texto': 'Cachorro', 'pontuacao': 0},
        {'texto': 'Gato', 'pontuacao': 0},
        {'texto': 'Elefante', 'pontuacao': 0},
        {'texto': 'Tucunaré', 'pontuacao': 10},
      ],
    },
    {
      'texto': 'Quem negou cristo?',
      'respostas': [
        {'texto': 'Lucas', 'pontuacao': 0},
        {'texto': 'Caim', 'pontuacao': 0},
        {'texto': 'Judas', 'pontuacao': 0},
        {'texto': 'Pedro', 'pontuacao': 10},
      ],
    }
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
      print(_perguntaSelecionada);
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text('Perguntas'),
            foregroundColor: Colors.white,
            centerTitle: true,
            backgroundColor: Colors.blue),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
