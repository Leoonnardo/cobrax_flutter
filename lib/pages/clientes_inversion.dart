import 'package:flutter/material.dart';

class ClienteInversion extends StatefulWidget {
  const ClienteInversion({super.key});

  @override
  State<ClienteInversion> createState() => _ClienteInversionState();
}

class _ClienteInversionState extends State<ClienteInversion> {
  @override
  Widget build(BuildContext context) {
    List<String> listTitles = <String>[
      'Clientes inversion',
      'Inversiones',
      'Cliente Invf001',
      'Cliente Invf002',
      'Cliente Invf003'
    ];

    return MaterialApp(
        title: 'Cobrax',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Clientes inversion - Prestamos'),
            backgroundColor: Colors.black,
            leading: Image.asset(
              "assets/images/icon_cobrax.png",
              scale: 8,
            ),
          ),
          body: Container(
              child: Column(
            children: [
              cardSeccion(listTitles[0], "clientes"),
              cardSeccion(listTitles[1], "vs_inversion"),
              cardSeccion(listTitles[2], "amortizacion1"),
              cardSeccion(listTitles[3], "amortizacion2"),
              cardSeccion(listTitles[4], "amortizacion3")
            ],
          )),
        ));
  }

  Card cardSeccion(titulo, ruta) {
    return Card(
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
