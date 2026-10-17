import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/marca.dart';
import '../models/moto.dart';

class ServicioMotos {
  static const String _rutaMotos = 'assets/data/motos.json';
  static const String _rutaMarcas = 'assets/data/marcas.json';

  Future<List<Moto>> cargarMotos() async {
    final texto = await rootBundle.loadString(_rutaMotos);
    final lista = jsonDecode(texto) as List<dynamic>;
    return lista
        .map((elemento) => Moto.fromJson(elemento as Map<String, dynamic>))
        .toList();
  }

  Future<List<Marca>> cargarMarcas() async {
    final texto = await rootBundle.loadString(_rutaMarcas);
    final lista = jsonDecode(texto) as List<dynamic>;
    return lista
        .map((elemento) => Marca.fromJson(elemento as Map<String, dynamic>))
        .toList();
  }
}
