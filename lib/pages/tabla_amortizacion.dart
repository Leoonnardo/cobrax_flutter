import 'package:flutter/material.dart';

class TablaAmortizacion extends StatefulWidget {
  const TablaAmortizacion({super.key});

  @override
  State<TablaAmortizacion> createState() => _TablaAmortizacionState();
}

class _TablaAmortizacionState extends State<TablaAmortizacion> {
  @override
  Widget build(BuildContext context) {
    List<String> listTitles = <String>[
      'Inversion',
      'Apsara prestamo con capital',
      'Ashir prestamo con capital'
    ];

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Tabla de amortizacion'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          cardSeccion(listTitles[0], "inversion_a"),
          cardSeccion(listTitles[1], "apsara_p_capital"),
          cardSeccion(listTitles[2], "ashir_p_capital")
        ],
      ),
    ));
  }

  Card cardSeccion(titulo, ruta) {
    return Card(
      color: Colors.green,
      child: ListTile(
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
