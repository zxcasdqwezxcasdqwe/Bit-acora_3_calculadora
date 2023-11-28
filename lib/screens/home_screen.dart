import 'package:calculadora_escala/widgets/calculadora.dart';
import 'package:calculadora_escala/widgets/config.dart';
import 'package:calculadora_escala/widgets/tablas.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _Widgesitos = <Widget>[
    const Calculator(),
    const Tables(),
    const Configuration(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora')),
      body: _Widgesitos[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.calculate), label: 'Calculadora'),
            BottomNavigationBarItem(
                icon: Icon(Icons.table_rows), label: 'Tabla'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Configuración'),
          ]),
    );
  }
}
