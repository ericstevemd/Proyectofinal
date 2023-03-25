import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fron_cliente/model/TranzacionModelo.dart';
import 'package:fron_cliente/pages/info.dart';
import 'package:fron_cliente/pages/servicios/crearProducto.dart';
import 'package:fron_cliente/pages/tranzanciones/CrearTranzacion.dart';
import 'package:http/http.dart' as http;

class Tranzaccion extends StatefulWidget {
  const Tranzaccion({super.key});

  @override
  State<Tranzaccion> createState() => _TranzaccionState();
}

List<TranzacionMode> Histori = [];

class _TranzaccionState extends State<Tranzaccion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("lista De Lista de transaciones "),
      ),
      body: Lista(),
      floatingActionButton: _boton(context),
    );
  }
}

Lista() {
  return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: Histori.length,
            itemBuilder: (context, index) {
              return Card(
                child: Container(
                  child: Column(children: [
                    Image(
                      image: NetworkImage(Histori[index].foto),
                      width: 600,
                    ),
                    Column(
                      children: [
                        Text(Histori[index].estado),
                        Text(Histori[index].titularbanco),
                        Text(Histori[index].numerodecomporbantes),
                        Text(Histori[index].valora),
                        TextButton(
                            onPressed: () {
                              print(Histori[index].foto);
                              // Histori[index].foto;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          info(Histori[index].foto)));
                            },
                            child: const Text("Modificar Estado "))
                      ],
                    )
                  ]),
                ),
              );
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      });
}

/* Lista() {
  return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: Histori.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(children: [
                    Text(
                      "Nombre del banco : ${Histori[index].bancoorige}  ",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      "Cuenta de banco :${Histori[index].numerocuenta}  ",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      "Tipo de cuenta :${Histori[index].tipocuenta}  ",
                      style: TextStyle(fontSize: 18),
                    ),
                  ]),
                );
              });
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      });
} */

Future<List<TranzacionMode>> getData() async {
  final response = await http.get(
    Uri.parse("http://10.0.2.2:8000/api/historial/"),
  );

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    print(data);
    print(data["results"]);

    for (final index in data["results"]) {
      Histori.add(TranzacionMode.fromJson(index));
    }
    return Histori;
  } else {
    return Histori;
  }
}

_boton(context) {
  return FloatingActionButton(
    onPressed: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const creartranzacion()));
    },
    child: const Icon(Icons.add),
  );
}
