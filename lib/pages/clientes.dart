import 'package:cobrax/services/apsara_servicio.dart';
import 'package:cobrax/services/clientes_servicio.dart';
import 'package:cobrax/services/vs_servicio.dart';
import 'package:cobrax/widgets/ventana_datos.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Clientes());

class Clientes extends StatefulWidget {
  const Clientes({super.key});

  @override
  State<Clientes> createState() => _ClientesState();
}

class _ClientesState extends State<Clientes> {
  var db = ClientesInversionData();

  @override
  Widget build(BuildContext context) {
    var ventana = Ventanas();
    final Size size = MediaQuery.of(context).size;

    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Clientes inversion'),
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
                                  title: Text(
                                      "Codigo de cliente: ${data[index]["codigoCliente"]}"),
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
        datoInversion("Codigo de cliente: ", "${data["codigoCliente"]}"),
        datoInversion("Cliente: ", "${data["cliente"]}"),
        datoInversion("Rfc: ", "${data["rfc"]}"),
        datoInversion("Curp: ", "${data["curp"]}"),
        datoInversion("Fecha de inversion: ", "${data["fechaInversion"]}"),
        datoInversion("Tasa anual: ", "${data["tasaAnual"]}"),
        datoInversion("Tasa mensual: ", "${data["tasaMensual"]}"),
        datoInversion("Plazo: ", "${data["plazo"]}"),
        datoInversion("Monto: ", "${data["monto"]}"),
        datoInversion("Retorno capital: ", "${data["retornoCapital"]}"),
        datoInversion("Incremento capital: ", "${data["incrementoCapital"]}"),
        datoInversion("Saldo: ", "${data["saldo"]}"),
        datoInversion("Interes mensual: ", "${data["interesMensual"]}"),
        datoInversion("Fecha termino: ", "${data["fechaTermino"]}"),
        datoInversion("Comision porciento: ", "${data["comisionPorciento"]}"),
        datoInversion("Comision dinero: ", "${data["comisionDinero"]}"),
        datoInversion("Comisionista: ", "${data["comisionista"]}"),
        datoInversion("Fecha pago comision: ", "${data["fechaPagoComision"]}"),
        datoInversion("Pago rendimiento: ", "${data["pagoRendimiento"]}"),
        datoInversion("Docto pago: ", "${data["doctoPago"]}"),
        datoInversion("Ultimo pago: ", "${data["fechaUltimoPago"]}"),
        datoInversion("Proximo pago: ", "${data["fechaProxPago"]}"),
        datoInversion("Correo electronico: ", "${data["Correo electronico"]}"),
      ],
    );
  }

  Widget datoInversion(titulo, subtitulo) {
    return SizedBox(
      height: 25,
      child: ListTile(
        title: Text(
          titulo,
        ),
        trailing: Text(
          subtitulo,
        ),
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
