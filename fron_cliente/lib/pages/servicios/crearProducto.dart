import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:dio/dio.dart';

class nuevoservicio extends StatefulWidget {
  const nuevoservicio({super.key});

  @override
  State<nuevoservicio> createState() => _nuevoservicioState();
}

@override
class _nuevoservicioState extends State<nuevoservicio> {
  File? imagen = null;
  final picker = ImagePicker();

  TextEditingController _detalle1 = TextEditingController();
  TextEditingController _detalle2 = TextEditingController();
  TextEditingController _precio = TextEditingController();

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
      String _detalle1, String _detalle2, String _precio) async {
    try {
      String filename = imagen!.path.split("/").last;
      FormData forndata = new FormData.fromMap({
        "detalle1": _detalle1,
        "detalle2": _detalle2,
        "precio": _precio,
        'imag': await MultipartFile.fromFile(imagen!.path, filename: filename),
      });
      print(forndata);
      await dio
          .post("http://10.0.2.2:8000/api/producto/", data: forndata)
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
              controller: _detalle1,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: 'Nuevo Producto',
                prefixIcon: Icon(Icons.shopping_cart),
              ),
            ),
            TextFormField(
              controller: _detalle2,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: 'Descricion del producto ',
                prefixIcon: Icon(Icons.description),
              ),
            ),
            TextFormField(
              controller: _precio,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: 'Precio',
                prefixIcon: Icon(Icons.currency_bitcoin),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    subir_image(_detalle1.text, _detalle2.text, _precio.text);
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
