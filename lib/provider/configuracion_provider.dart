import "package:flutter/material.dart";

class ConfigurationProvider with ChangeNotifier {
  int _puntaje_max = 0;
  int _exigencia = 0;
  double _nota_min = 0;
  double _nota_max = 0;
  double _nota_aprob = 0;
  double _incremento = 0;

  int get puntaje_max => _puntaje_max;
  void incremento() {
    _puntaje_max++;
    notifyListeners();
  }

  void setPuntaje_max(int valor) {
    _puntaje_max = valor;
  }
}
