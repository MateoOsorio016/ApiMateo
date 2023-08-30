// To parse this JSON data, do
//
//     final departamento = departamentoFromJson(jsonString);

import 'dart:convert';

List<Departamento> departamentoFromJson(String str) => List<Departamento>.from(json.decode(str).map((x) => Departamento.fromJson(x)));

String departamentoToJson(List<Departamento> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Departamento {
    final String iddepto;
    final String nomdepto;
    final String deptolatitud;
    final String deptolongitud;

    Departamento({
        required this.iddepto,
        required this.nomdepto,
        required this.deptolatitud,
        required this.deptolongitud,
    });

    factory Departamento.fromJson(Map<String, dynamic> json) => Departamento(
        iddepto: json["iddepto"],
        nomdepto: json["nomdepto"],
        deptolatitud: json["deptolatitud"],
        deptolongitud: json["deptolongitud"],
    );

    Map<String, dynamic> toJson() => {
        "iddepto": iddepto,
        "nomdepto": nomdepto,
        "deptolatitud": deptolatitud,
        "deptolongitud": deptolongitud,
    };
}
