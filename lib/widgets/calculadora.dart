import 'package:calculadora_escala/provider/configuracion_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(context.watch<ConfigurationProvider>().puntaje_max.toString()),
          ElevatedButton(
              onPressed: () {
                context.read<ConfigurationProvider>().incremento();
              },
              child: const Text('Botonsito'))
        ],
      ),
    );
  }
}
