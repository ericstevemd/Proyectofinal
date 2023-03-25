// To parse this JSON data, do
//
//     final tranzacionMode = tranzacionModeFromJson(jsonString);

import 'dart:convert';

List<TranzacionMode> tranzacionModeFromJson(String str) =>
    List<TranzacionMode>.from(
        json.decode(str).map((x) => TranzacionMode.fromJson(x)));

String tranzacionModeToJson(List<TranzacionMode> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TranzacionMode {
  TranzacionMode({
    required this.idusuario,
    required this.idcuenta,
    required this.idproducto,
    required this.idnegocio,
    required this.valora,
    required this.foto,
    required this.numerodecomporbantes,
    required this.bancoorige,
    required this.estado,
    required this.titularbanco,
    required this.tipoCuenta,
    required this.descricion,
  });

  int idusuario;
  int idcuenta;
  int idproducto;
  int idnegocio;
  String valora;
  String foto;
  String numerodecomporbantes;
  String bancoorige;
  String estado;
  String titularbanco;
  String tipoCuenta;
  String descricion;

  factory TranzacionMode.fromJson(Map<String, dynamic> json) => TranzacionMode(
        idusuario: json["idusuario"],
        idcuenta: json["idcuenta"],
        idproducto: json["idproducto"],
        idnegocio: json["idnegocio"],
        valora: json["valora"],
        foto: json["foto"],
        numerodecomporbantes: json["numerodecomporbantes"],
        bancoorige: json["bancoorige"],
        estado: json["estado"],
        titularbanco: json["titularbanco"],
        tipoCuenta: json["tipo_cuenta"],
        descricion: json["descricion"],
      );

  Map<String, dynamic> toJson() => {
        "idusuario": idusuario,
        "idcuenta": idcuenta,
        "idproducto": idproducto,
        "idnegocio": idnegocio,
        "valora": valora,
        "foto": foto,
        "numerodecomporbantes": numerodecomporbantes,
        "bancoorige": bancoorige,
        "estado": estado,
        "titularbanco": titularbanco,
        "tipo_cuenta": tipoCuenta,
        "descricion": descricion,
      };
}
