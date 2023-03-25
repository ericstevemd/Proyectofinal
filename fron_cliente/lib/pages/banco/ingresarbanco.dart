import 'dart:convert';

import 'package:flutter/material.dart';
import "package:fron_cliente/model/bancoModel.dart";

import 'package:http/http.dart' as http;

class ingresarbanco extends StatefulWidget {
  const ingresarbanco({super.key});

  @override
  State<ingresarbanco> createState() => _ingresarbancoState();
}

TextEditingController Nbanco = TextEditingController();
TextEditingController _cdbanco = TextEditingController();
TextEditingController _Tipo = TextEditingController();

final _formkey = GlobalKey<FormState>();

class _ingresarbancoState extends State<ingresarbanco> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Crear Banco"),
        ),
        body: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: Nbanco,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: 'Nombre del banco  ',
                  prefixIcon: Icon(Icons.person),
                ),
              ),

              /* SwitchListTile(
                    title: const Text('¿Es un Administrado?'),
                    value: administrado,
                    onChanged: (bool? value) {
                      if (value != null) {
                        administrado = value;
                        setState(() {});
                      }
                    }), */
              /* DropdownButtonFormField(
                value: _tipo,
                onChanged: (value) {},
                items: [
                  DropdownMenuItem<String>(child: Text('-choose-'), value: ''),
                  DropdownMenuItem<String>(
                      child: Text('Ahorro'), value: 'Ahorro'),
                  DropdownMenuItem<String>(
                      child: Text('Corriente'), value: 'Corriente'),
                ],
              ), */
              TextFormField(
                controller: _Tipo,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: 'Tipo Cuenta ',
                  prefixIcon: Icon(Icons.balance),
                ),
              ),
              TextFormField(
                controller: _cdbanco,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: 'Cuenta bancaria ',
                  prefixIcon: Icon(Icons.balance),
                ),
              ),
              TextButton(
                onPressed: () {
                  datopueba(_cdbanco.text, Nbanco.text, _Tipo.text);
                },
                child: const Text('Ingresar Cuenta bancaria '),
              )
            ],
          ),
        ));
  }
}

datopueba(String nombre, String Numerocuenta, String Tipodecuenta) async {
  try {
    // String filename = imagen!.path.split('/').last;

    var response =
        await http.post(Uri.parse('http://10.0.2.2:8000/api/cuenta/'), body: {
      "tipocuenta": Tipodecuenta,
      "nombrebanco": nombre,
      "numerocuenta": Numerocuenta,
    });
    print(response.body);
  } catch (e) {
    print(e);
  }
}
