import 'package:calculadora_escala/provider/configuracion_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Tables extends StatefulWidget {
  const Tables({super.key});

  @override
  State<Tables> createState() => _TablesState();
}

class _TablesState extends State<Tables> {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
          itemCount: context.read<ConfigurationProvider>().puntajeMax + 1,
          itemBuilder: (context, index) {
            return Center(
                child: Text(
              '$index    ${context.read<ConfigurationProvider>().calcular(index)}',
              style: const TextStyle(fontSize: 20),
            ));
          }),
    );
  }
}
