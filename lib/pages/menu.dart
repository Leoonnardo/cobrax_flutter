import 'package:cobrax/pages/tabla_amortizacion.dart';
import 'package:cobrax/services/inversion_servicio.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MenuPage());

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  var db = InversionData();

  @override
  Widget build(BuildContext context) {
    List<String> listTitles = <String>[
      'Tabla de amortización',
      'Clientes inversión - prestamos'
    ];
    return MaterialApp(
        title: 'Cobrax',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Cobrax'),
            backgroundColor: Colors.black,
            leading: Image.asset(
              "assets/images/icon_cobrax.png",
              scale: 8,
            ),
          ),
          body: Column(
            children: [
              cardSeccion(listTitles[0], "tablaAmortizacion"),
              cardSeccion(listTitles[1], "clienteInversion")
            ],
          ),
        ));
  }

  Card cardSeccion(titulo, ruta) {
    return Card(
      elevation: 8,
      color: Color(0xFF00B63F),
      child: ListTile(
        minVerticalPadding: 40,
        title: Text(titulo),
        trailing: TextButton(
            style: ElevatedButton.styleFrom(
              // backgroundColor: ColorSelect.button,
              // side: const BorderSide(width: 2, color: ColorSelect.button),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pushNamed(context, ruta);
            }),
      ),
    );
  }
}
