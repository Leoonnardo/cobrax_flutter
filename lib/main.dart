import 'package:cobrax/pages/amortizacion1.dart';
import 'package:cobrax/pages/amortizacion2.dart';
import 'package:cobrax/pages/amortizacion3.dart';
import 'package:cobrax/pages/apsara_p_capital.dart';
import 'package:cobrax/pages/ashir_p_capital.dart';
import 'package:cobrax/pages/clientes.dart';
import 'package:cobrax/pages/clientes_inversion.dart';
import 'package:cobrax/pages/inversion_a.dart';
import 'package:cobrax/pages/menu.dart';
import 'package:cobrax/pages/tabla_amortizacion.dart';
import 'package:cobrax/pages/vs_inversion.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cobrax',
      initialRoute: 'inicio',
      routes: {
        'inicio': (_) => const MenuPage(),
        'tablaAmortizacion': (_) => const TablaAmortizacion(),
        'clienteInversion': (_) => const ClienteInversion(),
        'inversion_a': (_) => const InversionPage(),
        'apsara_p_capital': (_) => const ApsaraPrestamoCapital(),
        'ashir_p_capital': (_) => const AshirPrestamoCapital(),
        'clientes': (_) => const Clientes(),
        'vs_inversion': (_) => const VsInversion(),
        'amortizacion1': (_) => const Amortizacion1(),
        'amortizacion2': (_) => const Amortizacion2(),
        'amortizacion3': (_) => const Amortizacion3(),
      },
    );
  }
}
