import 'dart:convert';

List<UsuarioMode> usuarioModeFromJson(String str) => List<UsuarioMode>.from(
    json.decode(str).map((x) => UsuarioMode.fromJson(x)));

String usuarioModeToJson(List<UsuarioMode> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UsuarioMode {
  UsuarioMode({
    required this.rol,
    required this.nombre,
    required this.apellido,
    required this.cedula,
    required this.user,
    required this.clave,
    required this.telefono,
    required this.correo,
    required this.direccion,
  });

  int rol;
  String nombre;
  String apellido;
  String cedula;
  String user;
  String clave;
  String telefono;
  String correo;
  String direccion;

  factory UsuarioMode.fromJson(Map<String, dynamic> json) => UsuarioMode(
        rol: json["rol"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        cedula: json["cedula"],
        user: json["user"],
        clave: json["clave"],
        telefono: json["telefono"],
        correo: json["correo"],
        direccion: json["direccion"],
      );

  Map<String, dynamic> toJson() => {
        "rol": rol,
        "nombre": nombre,
        "apellido": apellido,
        "cedula": cedula,
        "user": user,
        "clave": clave,
        "telefono": telefono,
        "correo": correo,
        "direccion": direccion,
      };
}
