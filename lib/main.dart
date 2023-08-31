import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/infracture/models/departamento.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Departamento> departamentos = [];

  @override
  void initState() {
    super.initState();
    getDepartamentos();
  }

  Future<void> getDepartamentos() async {
    final response = await Dio().get('https://www.datos.gov.co/resource/ya3g-4kqg.json');
    if (response.statusCode == 200) {
      final jsonData = response.data;
      final jsonString = json.encode(jsonData);
      List<Departamento> departamentolist = departamentoFromJson(jsonString);

      setState(() {
        departamentos = departamentolist;
      });
    } else {
      print("Error en la solicitud: ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var departamento in departamentos)
                  Column(
                    children: [
                      Text(departamento.iddepto),
                      Text(departamento.nomdepto),
                      Text(departamento.deptolatitud),
                      Text(departamento.deptolongitud),
                      const Divider(),
                    ],
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
