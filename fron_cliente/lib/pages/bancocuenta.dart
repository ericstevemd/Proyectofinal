import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fron_cliente/model/bancoModel.dart';
import 'package:http/http.dart' as http;
import 'package:fron_cliente/provider/bancosprovider.dart';
import 'banco/ingresarbanco.dart';

class bancocuenta extends StatefulWidget {
  const bancocuenta({super.key});

  @override
  State<bancocuenta> createState() => _bancocuentaState();
}

class _bancocuentaState extends State<bancocuenta> {
  List<BancosMode> bancos = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("lista De Cuenta"),
      ),
      body: Lista(),
      //floatingActionButton: _boton(context),
    );
  }

  Lista() {
    return FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: bancos.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(children: [
                      Text(
                        "Nombre del banco : ${bancos[index].nombrebanco}  ",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "Cuenta de banco :${bancos[index].numerocuenta}  ",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "Tipo de cuenta :${bancos[index].tipocuenta}  ",
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
  }

  Future<List<BancosMode>> getData() async {
    final response = await http.get(
      Uri.parse("http://10.0.2.2:8000/api/cuenta/"),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      print(data["results"]);

      for (final index in data["results"]) {
        bancos.add(BancosMode.fromJson(index));
      }
      return bancos;
    } else {
      return bancos;
    }
  }
}
/* 
_boton(context) {
  return FloatingActionButton(
    onPressed: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ingresarbanco()));
    },
    child: const Icon(Icons.add),
  );
}
 */










/* 
class banco extends StatelessWidget {
  //final productosProvider = new ProductosProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Banco "),
      ),
      body: _texto(),
      floatingActionButton: _boton(context),
    );
  }
}
 */