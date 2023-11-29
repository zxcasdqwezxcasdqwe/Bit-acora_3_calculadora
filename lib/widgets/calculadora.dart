import 'package:calculadora_escala/provider/configuracion_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String output = "0";
  String _output = "0";
  int output2 = 0;
  double num1 = 0;
  double num2 = 0;
  String operand = "";
  buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _output = "0";
      num1 = 0;
      num2 = 0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "*") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        print("Ya contiene un decimal");
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "*") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      num1 = 0;
      num2 = 0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }
    setState(() {
      output2 = int.parse(_output);
      output = double.parse(_output).toStringAsFixed(0);
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: SizedBox(
        height: 100.0,
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0.0,
                  backgroundColor: const Color(0xFF272B33),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              child: Text(
                buttonText,
                style: const TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              onPressed: () => buttonPressed(buttonText)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      Container(
        color: Colors.black,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Text(
          'Puntaje=         $output\nNota=      ${context.read<ConfigurationProvider>().calcular(output2)}',
          style: const TextStyle(
              fontSize: 48.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      Container(
        color: Colors.black,
        child: Column(
          children: [
            Row(
              children: [
                buildButton("7"),
                buildButton("8"),
                buildButton("9"),
                buildButton("/"),
              ],
            ),
            Row(
              children: [
                buildButton("4"),
                buildButton("5"),
                buildButton("6"),
                buildButton("*"),
              ],
            ),
            Row(
              children: [
                buildButton("1"),
                buildButton("2"),
                buildButton("3"),
                buildButton("+"),
              ],
            ),
            Row(
              children: [
                buildButton("C"),
                buildButton("0"),
                buildButton("."),
                buildButton("="),
              ],
            )
          ],
        ),
      )
    ]));
  }
}
