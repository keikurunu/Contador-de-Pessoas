import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Contador de Pessoas",
      home: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _pessoas = 0;
  String _infoText = 'Pode entrar';

  void _mudandoPessoas(int delta) {
    setState(
      () {
        _pessoas += delta;

        if (_pessoas < 0) {
          _infoText = "Opa! Cadê esse Povo?? D:";
        } else if (_pessoas <= 10) {
          _infoText = 'Pode ir entrando!';
        } else {
          _infoText = "Ta lotadão! o.O";
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "image/foto_restaurante.jpg",
          fit: BoxFit.cover,
          height: 1000,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Pessoas: $_pessoas',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextButton(
                    onPressed: () {
                      _mudandoPessoas(1);
                    },
                    child: Text(
                      '+1',
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextButton(
                      onPressed: () {
                        _mudandoPessoas(-1);
                      },
                      child: Text(
                        '-1',
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      )),
                )
              ],
            ),
            Text(
              _infoText,
              // ignore: prefer_const_constructors
              style: TextStyle(
                color: Colors.white,
                // fontSize: 30,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
