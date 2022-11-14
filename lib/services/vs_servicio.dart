import 'dart:convert';

import 'package:cobrax/data/informacion.dart';
import 'package:http/http.dart' as http;

class VsData {
  VsData();

  Future<List<dynamic>> getInversion() async {
    final response = await http.get(
        Uri.parse("http://$ip:3000/ClientesInversion/Vs"),
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
