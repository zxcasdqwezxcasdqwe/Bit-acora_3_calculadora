import "package:flutter/material.dart";

class ConfigurationProvider with ChangeNotifier {
  int _puntajeMax = 100;
  double _exigencia = 0.6;
  double _notaMin = 1.0;
  double _notaMax = 7.0;
  double _notaAprob = 4.0;
  int _incremento = 2;

  int get puntajeMax => _puntajeMax;
  double get exigencia => _exigencia;
  double get notaMin => _notaMin;
  double get notaMax => _notaMax;
  double get notaAprob => _notaAprob;
  int get incremento => _incremento;

  void setPuntajeMax(int valor) {
    _puntajeMax = valor;
  }

  void setExigencia(double valor) {
    _exigencia = valor;
  }

  void setNotaMin(double valor) {
    _notaMin = valor;
  }

  void setNotaMax(double valor) {
    _notaMax = valor;
  }

  void setNotaAprob(double valor) {
    _notaAprob = valor;
  }

  String calcular(int puntaje) {
    double valor = 0;
    if (puntaje < _exigencia * _puntajeMax) {
      valor = _calculoMenor(puntaje);
    } else if (puntaje >= _exigencia * _puntajeMax) {
      valor = _calculoMayor(puntaje);
    }
    return valor.toStringAsFixed(2);
  }

  double _calculoMenor(int puntaje) {
    double valor = 0;
    valor = (_notaAprob - _notaMin) * (puntaje / (_exigencia * _puntajeMax));
    valor += _notaMin;
    valor.roundToDouble();
    return valor;
  }

  double _calculoMayor(int puntaje) {
    double valor = 0;
    valor = (_notaMax - _notaAprob) *
        ((puntaje - (_exigencia * _puntajeMax)) /
            (_puntajeMax * (1 - _exigencia)));
    valor += _notaAprob;
    valor.roundToDouble();
    return valor;
  }
}
