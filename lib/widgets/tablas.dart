import 'package:flutter/material.dart';

class Tables extends StatefulWidget {
  const Tables({super.key});

  @override
  State<Tables> createState() => _TablesState();
}

class _TablesState extends State<Tables> {
  double calcular() {
    double napr = 4.0;
    double nmin = 1.0;
    double nmax = 7.0;
    double p = 90.0;
    double valor = (3.0 * ((p - 70.0) / 30.0)) + 4.0;

    return valor;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(calcular().toString(), style: const TextStyle(fontSize: 50)),
    );
  }
}
