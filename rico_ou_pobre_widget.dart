import 'package:flutter/material.dart';

class RicoOuPobreWidget extends StatefulWidget {
  @override
  _RicoOuPobreWidgetState createState() => _RicoOuPobreWidgetState();
}

class _RicoOuPobreWidgetState extends State<RicoOuPobreWidget> {
  int _valor = 0;
  String _mensagem = "Usuário Classe Média";

  int operacao(String op) {
    if (op == '+') {
      _valor += 100;
    } else if (op == '-') {
      _valor -= 100;
    } else {
      return null;
    }
    return _valor;
  }

  String total() {
    setState(() {
      if (_valor >= 1000) {
        _mensagem = "Situação Classe Alta";
      } else if (_valor <= 0) {
        _mensagem = "Situação Classe Baixa";
      } else {
        _mensagem = "Situação Classe Média";
      }
    });
    return _mensagem;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey,
      child: Container(
        color: Colors.green[600],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              " R\$ $_valor ",
              style: TextStyle(fontSize: 30, decoration: TextDecoration.none),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      operacao('+');
                    });
                  },
                  child: Text(
                    "+ 100",
                  ),
                ),
                Padding(padding: EdgeInsets.all(5.0)),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      operacao('-');
                    });
                  },
                  child: Text(
                    "- 100",
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.all(10.0)),
            Text(
              total(),
              style: TextStyle(fontSize: 30, decoration: TextDecoration.none),
            ),
            SizedBox(
              width: 2.0,
              height: 2.0,
            ),
            FloatingActionButton(
              child: Icon(Icons.replay),
              onPressed: () {
                setState(() {
                  _valor = 0;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
