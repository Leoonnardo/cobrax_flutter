import 'dart:convert';

import 'package:cobrax/data/informacion.dart';
import 'package:http/http.dart' as http;

class InversionData {
  InversionData();

  Future<List<dynamic>> getInversion() async {
    final response = await http.get(
        Uri.parse("http://$ip:3000/tablaAmortizacion/inversion"),
        headers: {"Content-Type": "application/json"});
    try {
      if (response.statusCode == 200) {
        // ignore: avoid_print
        final jsonResponse = json.decode(utf8.decode(response.bodyBytes));
        // print(response.body);
        print(jsonResponse);
        return jsonResponse;
      } else {
        return [];
      }
    } catch (e) {
      return [e];
    }
  }
}
