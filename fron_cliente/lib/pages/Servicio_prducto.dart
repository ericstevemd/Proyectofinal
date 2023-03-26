import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fron_cliente/model/ServicioModel.dart';
import 'package:fron_cliente/pages/servicios/crearProducto.dart';
import 'package:http/http.dart' as http;
import 'package:fron_cliente/pages/tranzanciones/CrearTranzacion.dart';

class ServicioProducto extends StatefulWidget {
  const ServicioProducto({super.key});

  @override
  State<ServicioProducto> createState() => _ServicioProductoState();
}

List<ProductoMode> Producto = [];

class _ServicioProductoState extends State<ServicioProducto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Servicion/Producto"),
      ),
      body: Lista(),
      // floatingActionButton: _CrearProducto(context),
    );
  }
}

Lista() {
  return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: Producto.length,
            itemBuilder: (context, index) {
              return Card(
                child: Container(
                  child: Column(children: [
                    Image(
                      image: NetworkImage('${Producto[index].imag}'),
                    ),
                    /* FadeInImage(
                       placeholder:
                          const AssetImage('assets/imag/073 jar-loading.gif'),
                      image: NetworkImage(Producto[index].imag),
                      fadeInDuration: const Duration(milliseconds: 200),
                    ), */
                    Column(
                      children: [
                        Text('${Producto[index].detalle1}'),
                        Text('${Producto[index].precio}'),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => creartranzacion(),
                                ),
                              );
                            },
                            child: const Text("Validacion de pago"))
                      ],
                    )
                  ]),
                ),
              );
            },
          );
        } else {
          return const Center(
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

Future<List<ProductoMode>> getData() async {
  final response = await http.get(
    Uri.parse("http://10.0.2.2:8000/api/producto/"),
  );

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    print(data);
    print(data["results"]);

    for (final index in data["results"]) {
      Producto.add(ProductoMode.fromJson(index));
    }
    return Producto;
  } else {
    return Producto;
  }
}

/* _CrearProducto(context) {
  return FloatingActionButton(
    onPressed: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const nuevoservicio()));
    },
    child: const Icon(Icons.add),
  );
}
 */