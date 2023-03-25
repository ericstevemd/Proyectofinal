import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fron_cliente/pages/home.dart';
import 'package:fron_cliente/pages/homeCliente.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
/*   void ingresar(usuario, pass) async {
    try {
      var url = 'http://10.0.2.2:8000/api/usuario/';
      var response = await http.post(Uri.parse(url), body: {
        'user': usuario,
        'clave': pass,

      }).timeout(const Duration(seconds: 90));
      print(response.body);
      if (response.body == '1') {
        print(response.body);
        Navigator.pushNamed(context, '/home',
            arguments: {' user': user, "clave": pass});
        FocusScope.of(context).unfocus();
      } else {
        print("usuario incorrecto ");
      }
    } on TimeoutException catch (e) {
      print('Tardo mucho la conexion');
    } on Error catch (e) {
      print('http Error');
    }
  } */

  TextEditingController pass = TextEditingController();
  TextEditingController user = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  bool administrado = false;
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              logo(),
              TextFormField(
                controller: user,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: 'user',
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Campo Requerido";
                  }
                  if (value.length <= 5) {
                    return "Usuario Demasiado Corto";
                  }
                },
              ),
              TextFormField(
                controller: pass,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.password),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Field is required.';
                  String pattern =
                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                  if (!RegExp(pattern).hasMatch(value))
                    return '''
                    PLa contraseña debe tener al menos 8 caracteres,
                   incluir una letra mayúscula, un número y un símbolo.
                    ''';
                  return null;
                },
              ),
              /*   SwitchListTile(
                title: const Text('¿Es un Administrado?'),
                value: administrado,
                onChanged: (bool? value) {
                  if (value != null) {
                    administrado = value;
                    setState(() {});
                  }
                },
              ), */
              TextButton(
                onPressed: () async {
                  if (user.text == 'administrador' &&
                      pass.text == 'Admini*12345') {
                    print("inicio de sesion fue exitosa ");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const home()));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const homeCliente()));

                    //   Navigator.pushReplacementNamed(context,homeCliente. homeCliente());
                  }
                },
                child: const Text('Ingresar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

logo() {
  return Column(
    children: [
      SizedBox(
        height: 250.0,
        width: 350.0,
        child: Image.asset('assets/Imag/descarga.png'),
      )
    ],
  );
}
