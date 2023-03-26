import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fron_cliente/pages/homeCliente.dart';
import 'package:image_picker/image_picker.dart';

class creartranzacion extends StatefulWidget {
  const creartranzacion({super.key});

  @override
  State<creartranzacion> createState() => _creartranzacionState();
}

class _creartranzacionState extends State<creartranzacion> {
  File? imagen = null;
  final picker = ImagePicker();

  TextEditingController _valora = TextEditingController();
  TextEditingController _numerodecomporbantes = TextEditingController();
  TextEditingController _bancoorige = TextEditingController();
  TextEditingController _titularbanco = TextEditingController();
  TextEditingController _tipo_cuenta = TextEditingController();
  TextEditingController _descricion = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  Future<void> selImagen(op) async {
    var PickedFile;
    if (op == 1) {
      PickedFile = await picker.pickImage(source: ImageSource.camera);
    } else {
      PickedFile = await picker.pickImage(source: ImageSource.gallery);
    }

    setState(() {
      if (PickedFile != null) {
        imagen = File(PickedFile.path);
      } else {
        print('no seleccionaste ninguna fato');
      }
    });
  }

  Dio dio = new Dio();
  Future<void> subir_image(
      String valora,
      String numerodecomporbantes,
      String bancoorige,
      String titularbanco,
      String tipoCuenta,
      String descricion) async {
    try {
      String filename = imagen!.path.split("/").last;
      FormData forndata = FormData.fromMap({
        "idusuario": 1.toString(),
        "idcuenta": 1.toString(),
        "idproducto": 1.toString(),
        "idnegocio": 1.toString(),
        "valora": valora,
        "numerodecomporbantes": numerodecomporbantes,
        "bancoorige": bancoorige,
        "titularbanco": titularbanco,
        "tipo_cuenta": tipoCuenta,
        "descricion": descricion,
        'foto': await MultipartFile.fromFile(imagen!.path, filename: filename),
      });
      print(forndata);
      await dio
          .post("http://10.0.2.2:8000/api/historial/", data: forndata)
          .then((value) {
        if (value.toString() == '1') {
          print("la foto se subido correctamente");
        } else {
          print(forndata);
        }
      });
    } catch (e) {
      print(e.toString());
    }
  }

  opciones(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              contentPadding: EdgeInsets.all(10),
              content: SingleChildScrollView(
                child: Column(children: [
                  InkWell(
                    onTap: () {
                      selImagen(1);
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1, color: Colors.grey),
                        ),
                      ),
                      child: Row(children: const [
                        Expanded(
                          child: Text(
                            'Tomar una Foto',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Icon(Icons.camera_alt, color: Colors.blue)
                      ]),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      selImagen(2);
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1, color: Colors.grey),
                        ),
                      ),
                      child: Row(children: const [
                        Expanded(
                          child: Text(
                            'selecionar foto ',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Icon(Icons.image, color: Colors.blue)
                      ]),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1, color: Colors.red),
                        ),
                      ),
                      child: Row(children: const [
                        Expanded(
                          child: Text('Cancelar',
                              style: TextStyle(
                                fontSize: 16,
                              )),
                        ),
                      ]),
                    ),
                  ),
                ]),
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crear Nuevo Producto "),
      ),
      body: Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imagen == null
                ? const Center()
                : Image.file(
                    imagen!,
                    height: 320,
                  ),
            TextFormField(
              controller: _valora,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: 'valora',
                prefixIcon: Icon(Icons.money),
              ),
            ),
            TextFormField(
              controller: _numerodecomporbantes,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: 'Numero De Comporbantes ',
                prefixIcon: Icon(Icons.numbers),
              ),
            ),
            TextFormField(
              controller: _bancoorige,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: 'Banco del titular',
                prefixIcon: Icon(Icons.account_balance_outlined),
              ),
            ),
            TextFormField(
              controller: _titularbanco,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: 'Nombre del Titular de banco ',
                prefixIcon: Icon(Icons.man_2),
              ),
            ),
            TextFormField(
              controller: _tipo_cuenta,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: 'Tipo de cuenta ',
                prefixIcon: Icon(Icons.account_balance_sharp),
              ),
            ),
            TextFormField(
              controller: _descricion,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: 'Descricion',
                prefixIcon: Icon(Icons.description),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    subir_image(
                        _valora.text,
                        _numerodecomporbantes.text,
                        _bancoorige.text,
                        _titularbanco.text,
                        _tipo_cuenta.text,
                        _descricion.text);
                    _valora.text = '';
                    _numerodecomporbantes.text = '';
                    _bancoorige.text = '';
                    _titularbanco.text = '';
                    _tipo_cuenta.text = '';
                    _descricion.text = '';
                    _mostrar(context);
                  },
                  child: const Text('Save'),
                ),
                TextButton(
                  onPressed: () {
                    opciones(context);
                  },
                  child: const Text('Subir Imagen'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void _mostrar(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text('Tranzancion '),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('tiene que espera que el valide el pago '),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const homeCliente(),
                      ));
                },
                child: Text("Ok "),
              )
            ],
          ),
        );
      });
}
