import 'package:calculadora_escala/provider/configuracion_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Configuration extends StatefulWidget {
  const Configuration({super.key});

  @override
  State<Configuration> createState() => _ConfigurationState();
}

class _ConfigurationState extends State<Configuration> {
  final valor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text(
            'Configuraciones',
            style: TextStyle(fontSize: 25),
          ),
          TextField(
            controller: valor,
            decoration: InputDecoration(
                hintText: config_pro(context).puntaje_max.toString()),
          ),
          ElevatedButton(
              onPressed: () {
                config_pro(context).setPuntaje_max(int.parse(valor.text));
                valor.text = '';
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
