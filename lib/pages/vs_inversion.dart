import 'package:cobrax/services/apsara_servicio.dart';
import 'package:cobrax/services/vs_servicio.dart';
import 'package:cobrax/widgets/ventana_datos.dart';
import 'package:flutter/material.dart';

void main() => runApp(const VsInversion());

class VsInversion extends StatefulWidget {
  const VsInversion({super.key});

  @override
  State<VsInversion> createState() => _VsInversionState();
}

class _VsInversionState extends State<VsInversion> {
  var db = VsData();

  @override
  Widget build(BuildContext context) {
    var ventana = Ventanas();
    final Size size = MediaQuery.of(context).size;

    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Inversiones'),
            backgroundColor: Colors.black,
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
                                      "Semana: ${data[index]["semanas"]}"),
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
        datoInversion("Semana: ", "${data["semanas"]}"),
        datoInversion("Ashir: ", "${data["ashir"]}"),
        datoInversion("Apsara: ", "${data["apsara"]}"),
      ],
    );
  }

  ListTile datoInversion(titulo, subtitulo) {
    return ListTile(
      title: Text(
        titulo,
        textScaleFactor: 1.2,
      ),
      trailing: Text(subtitulo, textScaleFactor: 1.2),
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
