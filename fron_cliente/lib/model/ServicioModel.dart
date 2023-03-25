// To parse this JSON data, do
//
//     final productoMode = productoModeFromJson(jsonString);

import 'dart:convert';

List<ProductoMode> productoModeFromJson(String str) => List<ProductoMode>.from(
    json.decode(str).map((x) => ProductoMode.fromJson(x)));

String productoModeToJson(List<ProductoMode> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductoMode {
  ProductoMode({
    required this.detalle1,
    required this.detalle2,
    required this.precio,
    required this.imag,
    required this.fecha,
  });

  String detalle1;
  String detalle2;
  String precio;
  String imag;
  DateTime fecha;

  factory ProductoMode.fromJson(Map<String, dynamic> json) => ProductoMode(
        detalle1: json["detalle1"],
        detalle2: json["detalle2"],
        precio: json["precio"],
        imag: json["imag"],
        fecha: DateTime.parse(json["fecha"]),
      );

  Map<String, dynamic> toJson() => {
        "detalle1": detalle1,
        "detalle2": detalle2,
        "precio": precio,
        "imag": imag,
        "fecha": fecha.toIso8601String(),
      };
}
