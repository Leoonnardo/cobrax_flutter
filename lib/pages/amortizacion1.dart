import 'package:cobrax/services/amortizacion1_servicio.dart';
import 'package:cobrax/widgets/ventana_datos.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Amortizacion1());

class Amortizacion1 extends StatefulWidget {
  const Amortizacion1({super.key});

  @override
  State<Amortizacion1> createState() => _Amortizacion1State();
}

class _Amortizacion1State extends State<Amortizacion1> {
  var db = Amortizacion1Data();

  @override
  Widget build(BuildContext context) {
    var ventana = Ventanas();
    final Size size = MediaQuery.of(context).size;

    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Cliente Invf001'),
              backgroundColor: Colors.black,
              leading: Image.asset(
                "assets/images/icon_cobrax.png",
                scale: 8,
              ),
            ),
            body: SizedBox(
                // color: ColorSelect.container,
                width: size.width,
                height: double.infinity,
                child: FutureBuilder(
                  initialData: const [],
                  future: db.getInversion(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      print('Waiting for connection');
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      if (!snapshot.hasData) {
                        print('There is no data');
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        List data = snapshot.data;
                        return RefreshIndicator(
                            // child: const Text('WELCOME LIST'),
                            child: ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (context, index) => Card(
                                color: Colors.amber,
                                child: ListTile(
                                  title: Text("Mes: ${data[index]["mes"]}"),
                                  trailing: TextButton(
                                      style: ElevatedButton.styleFrom(
                                        // backgroundColor: ColorSelect.button,
                                        // side: const BorderSide(width: 2, color: ColorSelect.button),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.black,
                                      ),
                                      onPressed: () {
                                        // Navigator.pushNamed(context, 'tabla');
                                        // ignore: avoid_print
                                        print("presione");
                                        showModalBottomSheet(
                                          backgroundColor: Colors.transparent,
                                          isScrollControlled: true,
                                          context: context,
                                          builder: (context) =>
                                              ventana.ventanaDato(
                                                  context,
                                                  data[index],
                                                  listaInversion(data[index])),
                                        );
                                      }),
                                ),
                              ),
                            ),
                            onRefresh: () async {
                              setState(() {});
                            });
                      }
                    }
                  },
                ))));
  }

  Column listaInversion(data) {
    return Column(
      children: [
        datoInversion("Mes: ", "${data["mes"]}"),
        datoInversion("Monto: ", "${data["monto"]}"),
        datoInversion("Pago sin IVA: ", "${data["pagoSinIva"]}"),
        datoInversion("Interes: ", "${data["interes"]}"),
        datoInversion("Capital: ", "${data["capital"]}"),
        datoInversion("Retencion ISR: ", "${data["retencionIsr"]}"),
        datoInversion("Total Mensual: ", "${data["totalMensual"]}"),
        datoInversion("Balance final: ", "${data["balanceFinal"]}"),
        datoInversion("Factura: ", "${data["factura"]}"),
        datoInversion("Periodo: ", "${data["periodo"]}"),
        datoInversion("Fecha pago: ", "${data["fechaPago"]}"),
        datoInversion("Referencia: ", "${data["referenciaPago"]}"),
      ],
    );
  }

  Widget datoInversion(titulo, subtitulo) {
    return SizedBox(
      height: 40,
      child: ListTile(
        title: Text(
          titulo,
          textScaleFactor: 1,
        ),
        trailing: Text(subtitulo, textScaleFactor: 1),
      ),
    );
  }

  Card cardSeccion(titulo, ruta) {
    return Card(
      color: Colors.amber,
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
