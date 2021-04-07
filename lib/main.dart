import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'IMC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String resultado = '';
  TextEditingController _peso = TextEditingController();
  TextEditingController _altura = TextEditingController();
  TextEditingController _resultado = TextEditingController();

  void _calculaImc() {
    setState(() {
      if (_altura.text.isEmpty) {
        _resultado.value =
            TextEditingValue(text: 'Digite sua altura para calcular');
        return;
      }
      if (_peso.text.isEmpty) {
        _resultado.value =
            TextEditingValue(text: 'Digite seu peso para calcular');
        return;
      }

      double peso = double.parse(_peso.text);
      double altura = double.parse(_altura.text);

      altura = altura / 100;

      double resultadoImc = peso / (altura * altura);

      if (resultadoImc < 18.5)
        _resultado.value = TextEditingValue(
            text: resultadoImc.toStringAsFixed(2) + ': Magreza');
      else if (resultadoImc >= 18.5 && resultadoImc <= 24.9)
        _resultado.value = TextEditingValue(
            text: resultadoImc.toStringAsFixed(2) + ': Peso normal');
      else if (resultadoImc >= 25 && resultadoImc <= 29.9)
        _resultado.value = TextEditingValue(
            text: resultadoImc.toStringAsFixed(2) + ': Sobrepeso');
      else if (resultadoImc >= 30 && resultadoImc <= 34.9)
        _resultado.value = TextEditingValue(
            text: resultadoImc.toStringAsFixed(2) + ': Obesidade de grau 1');
      else if (resultadoImc >= 35 && resultadoImc <= 39.9)
        _resultado.value = TextEditingValue(
            text: resultadoImc.toStringAsFixed(2) + ': Obesidade de grau 2');
      else if (resultadoImc >= 40)
        _resultado.value = TextEditingValue(
            text: resultadoImc.toStringAsFixed(2) + ': Obesidade de grau 3');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Digite sua altura em centímetros',
                        border: OutlineInputBorder()),
                    controller: _altura,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Digite seu peso em quilos',
                        border: OutlineInputBorder()),
                    controller: _peso,
                  ),
                ],
              ),
            ),
            RaisedButton(
              child: Text("Calcular"),
              onPressed: _calculaImc,
              color: Colors.blue,
              textColor: Colors.white,
              splashColor: Colors.blue,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                        labelText: 'Resultado', border: OutlineInputBorder()),
                    controller: _resultado,
                  ),
                ],
              ),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
