import 'dart:convert';
import 'package:demo/config/demo.config.dart';
import 'package:demo/models/demo.model.dart';
import 'package:http/http.dart' as http;

Future<List<Demo>> getDemo() async {
  final response = await http
      .get(Uri.parse('$servidorDemo/demo/list_active'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> datatmp = jsonDecode(response.body);
    final List<dynamic> data = datatmp['result'];
    final code = datatmp['code'] as int;
    if (code==200) {
      List<Demo> lista = data.map((item) => Demo.fromJson(item)).toList();
      return lista;
    }else{
      return [];
    }
    
    
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    return [];
  }
}

Future<List<Demo>> storeDemo(Demo item ) async {
  final response = await http
      .post(Uri.parse('$servidorDemo/demo/store'), body: json.encode(item) );

  if (response.statusCode == 200) {
    final Map<String, dynamic> datatmp = jsonDecode(response.body);
    final List<dynamic> data = datatmp['result'];
    final code = datatmp['code'] as int;
    // final message = datatmp['message'] as int;
    if (code==200) {
      List<Demo> lista = data.map((item) => Demo.fromJson(item)).toList();
      return lista;
    }else{
      return [];
    }
    
    
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    return [];
  }
}