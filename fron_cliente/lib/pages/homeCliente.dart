import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fron_cliente/model/usuarioMode.dart';
import 'package:fron_cliente/pages/Historial.dart';
import 'package:fron_cliente/pages/Historialclientes.dart';
import 'package:fron_cliente/pages/Servicio.dart';
import 'package:fron_cliente/pages/Servicio_prducto.dart';
import 'package:fron_cliente/pages/Tranzaccion.dart';
import "package:fron_cliente/pages/banco.dart";

import 'package:fron_cliente/pages/bancocuenta.dart';

import 'package:http/http.dart' as http;

class homeCliente extends StatefulWidget {
  const homeCliente({super.key});

  @override
  State<homeCliente> createState() => _homeClienteState();
}

class _homeClienteState extends State<homeCliente> {
  List<UsuarioMode> usuario = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: _darwedar(),
        appBar: AppBar(
          title: const Text('home'),
        ),
        body: Text('cliente'));
  }

  _darwedar() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("eric Steven "),
            accountEmail: Text('exaple@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                    "https://cdn.pixabay.com/photo/2018/08/23/07/35/thunderstorm-3625405_640.jpg",
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover),
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image: NetworkImage(
                    "https://cdn.pixabay.com/photo/2018/08/23/07/35/thunderstorm-3625405_640.jpg"),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.account_balance_rounded),
            title: const Text("Banco"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const bancocuenta(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.forward_outlined),
            title: const Text("Historial"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Tranzaccioncliente(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_basket_outlined),
            title: const Text("servicios"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ServicioProducto(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Future<List<UsuarioMode>> getData() async {
    final response = await http.get(
      Uri.parse("http://10.0.2.2:8000/api/usuario/"),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      print(data["results"]);
      for (final index in data["results"]) {
        usuario.add(UsuarioMode.fromJson(index));
      }
    }
    return usuario;
  }
}
