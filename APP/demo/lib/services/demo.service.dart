import 'dart:convert';
import 'package:demo/config/demo.config.dart';
import 'package:demo/models/demo.model.dart';
import 'package:http/http.dart' as http;

Future<List<Demo>> getDemo() async {
  final response = await http
      .get(Uri.parse('$servidorDemo/pokemon'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> datatmp = jsonDecode(response.body);
    final List<dynamic> data = datatmp['results'];
    List<Demo> lista = data.map((item) => Demo.fromJson(item)).toList();
    return lista;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    return [];
  }
}