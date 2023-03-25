import 'dart:convert';

List<BancosMode> bancosModeFromJson(String str) =>
    List<BancosMode>.from(json.decode(str).map((x) => BancosMode.fromJson(x)));

String bancosModeToJson(List<BancosMode> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BancosMode {
  BancosMode({
    required this.tipocuenta,
    required this.nombrebanco,
    required this.numerocuenta,
  });

  String tipocuenta;
  String nombrebanco;
  String numerocuenta;

  factory BancosMode.fromJson(Map<String, dynamic> json) => BancosMode(
        tipocuenta: json["tipocuenta"],
        nombrebanco: json["nombrebanco"],
        numerocuenta: json["numerocuenta"],
      );

  Map<String, dynamic> toJson() => {
        "tipocuenta": tipocuenta,
        "nombrebanco": nombrebanco,
        "numerocuenta": numerocuenta,
      };
}
