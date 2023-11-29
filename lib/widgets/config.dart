import 'package:calculadora_escala/provider/configuracion_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Configuration extends StatefulWidget {
  const Configuration({super.key});

  @override
  State<Configuration> createState() => _ConfigurationState();
}

class _ConfigurationState extends State<Configuration> {
  final valorPuntajeMax = TextEditingController();
  final valorExigencia = TextEditingController();
  final valorNotaMin = TextEditingController();
  final valorNotaMax = TextEditingController();
  final valorNotaAprob = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text(
            'Puntaje Máximo',
            style: TextStyle(fontSize: 25),
          ),
          TextField(
            controller: valorPuntajeMax,
            decoration: InputDecoration(
                hintText: config_pro(context).puntajeMax.toString()),
          ),
          const Text(
            'Exigencia',
            style: TextStyle(fontSize: 25),
          ),
          TextField(
            controller: valorExigencia,
            decoration: InputDecoration(
                hintText: config_pro(context).exigencia.toString()),
          ),
          const Text(
            'Nota Mínima',
            style: TextStyle(fontSize: 25),
          ),
          TextField(
            controller: valorNotaMin,
            decoration: InputDecoration(
                hintText: config_pro(context).notaMin.toString()),
          ),
          const Text(
            'Nota Máxima',
            style: TextStyle(fontSize: 25),
          ),
          TextField(
            controller: valorNotaMax,
            decoration: InputDecoration(
                hintText: config_pro(context).notaMax.toString()),
          ),
          const Text(
            'Nota Aprobación',
            style: TextStyle(fontSize: 25),
          ),
          TextField(
            controller: valorNotaAprob,
            decoration: InputDecoration(
                hintText: config_pro(context).notaAprob.toString()),
          ),
          ElevatedButton(
              onPressed: () {
                if (valorPuntajeMax.text.isNotEmpty) {
                  config_pro(context)
                      .setPuntajeMax(int.parse(valorPuntajeMax.text));
                }
                if (valorExigencia.text.isNotEmpty) {
                  config_pro(context)
                      .setExigencia(double.parse(valorExigencia.text));
                }
                if (valorNotaMin.text.isNotEmpty) {
                  config_pro(context)
                      .setNotaMin(double.parse(valorNotaMin.text));
                }
                if (valorNotaMax.text.isNotEmpty) {
                  config_pro(context)
                      .setNotaMax(double.parse(valorNotaMax.text));
                }
                if (valorNotaAprob.text.isNotEmpty) {
                  config_pro(context)
                      .setNotaAprob(double.parse(valorNotaAprob.text));
                }
                setState(() {});
              },
              child: const Text('Guardar'))
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  ConfigurationProvider config_pro(BuildContext context) {
    return context.read<ConfigurationProvider>();
  }
}
