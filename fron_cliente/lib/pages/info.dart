import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fron_cliente/model/TranzacionModelo.dart';
import 'package:http/http.dart' as http;

class info extends StatelessWidget {
  final TranzacionMode tranzacionMode;
  const info({super.key, required this.tranzacionMode});

  @override
  Widget build(BuildContext context) {
    TextEditingController Actualizar = TextEditingController();
    return Scaffold(
        appBar: AppBar(
            title: Text(
                'Nombre del titular de la cuenta ${tranzacionMode.titularbanco}')),
        body: Container(
          child: Center(
              child: Column(
            children: [
              Image.network(
                '${tranzacionMode.foto}',
                width: 400,
                height: 500,
              ),
              Text("${tranzacionMode.id.toString()}"),
              Text("${tranzacionMode.estado}"),
              TextFormField(
                controller: Actualizar,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: 'Actualizar estado ',
                  prefixIcon: Icon(Icons.system_update_alt_outlined),
                ),
              ),
              TextButton(
                  onPressed: () {
                    updatePost(tranzacionMode.id, Actualizar.text);
                  },
                  child: const Text('Actualizar'))
            ],
          )),
        ));
  }
}

Future<TranzacionMode> updatePost(int id, String estado) async {
  final response = await http.put(
    Uri.parse("http://10.0.2.2:8000/api/historial/$id"),
    body: jsonEncode({'id': id, 'estado': estado}),
  );
  print(id);
  print(estado);
  print(response);
  if (response.statusCode == 200) {
    return TranzacionMode.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to delete post: $id');
  }
}
