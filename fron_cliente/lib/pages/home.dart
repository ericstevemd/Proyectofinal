import 'package:flutter/material.dart';
import 'package:fron_cliente/pages/Historial.dart';
import 'package:fron_cliente/pages/Servicio.dart';
import 'package:fron_cliente/pages/Tranzaccion.dart';
import "package:fron_cliente/pages/banco.dart";

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Administrador'),
              accountEmail: Text('administrador@gmail.com'),
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
                    builder: (context) => const banco(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.forward_outlined),
              title: const Text("Tranzaccion"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Tranzaccion(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_shopping_cart_outlined),
              title: const Text("Servicio"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Servicio(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.file_upload_sharp),
              title: const Text("Historial"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Historial(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_balance_rounded),
              title: const Text("Banco"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const banco(),
                  ),
                );
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('home'),
      ),
    );
  }
}
