import 'dart:convert';

class Inversion {
  Inversion({
    required this.idInversion,
    required this.numeroPago,
    required this.fechaPago,
    required this.saldo,
    required this.interes,
    required this.capital,
    required this.interesAcomulado,
  });

  int idInversion;
  int numeroPago;
  String fechaPago;
  int saldo;
  int interes;
  int capital;
  int interesAcomulado;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
    "idInversion" : idInversion,
    "numeroPago"  : numeroPago,
    "fechaPago"  : fechaPago,
    "saldo"  : saldo,
    "interes"  : interes,
    "capital"  : capital,
    "interesAcomulado"  : interesAcomulado,
  };

  
}
