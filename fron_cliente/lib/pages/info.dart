import 'package:flutter/material.dart';

class info extends StatelessWidget {
  const info(String foto, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Info"),
        ),
        body: Container(
          child: Center(
              child: Column(
            children: [],
          )),
        ));
  }
}
