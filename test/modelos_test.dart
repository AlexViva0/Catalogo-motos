import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import 'package:catalogo_motos/data/models/marca.dart';
import 'package:catalogo_motos/data/models/moto.dart';

void main() {
  test('motos.json se convierte en objetos Moto con tipos estrictos', () {
    final texto = File('assets/data/motos.json').readAsStringSync();
    final lista = jsonDecode(texto) as List<dynamic>;
    final motos = lista
        .map((e) => Moto.fromJson(e as Map<String, dynamic>))
        .toList();

    expect(motos.length, 12);
    expect(motos.first.modelo, 'MT-07');
    expect(motos.first.cilindrada, 689);
    expect(motos.first.precio, 179900.0);
    expect(motos.first.colores, ['Negro', 'Azul', 'Gris']);
    expect(motos.where((m) => !m.tieneImagen).length, 4);
  });

  test('marcas.json se convierte en objetos Marca', () {
    final texto = File('assets/data/marcas.json').readAsStringSync();
    final lista = jsonDecode(texto) as List<dynamic>;
    final marcas = lista
        .map((e) => Marca.fromJson(e as Map<String, dynamic>))
        .toList();

    expect(marcas.length, 6);
    expect(marcas.map((m) => m.id), [
      'yamaha',
      'vento',
      'benelli',
      'suzuki',
      'italika',
      'kawasaki',
    ]);
  });

  test('cada moto pertenece a una marca existente', () {
    final motos = (jsonDecode(File('assets/data/motos.json').readAsStringSync())
            as List<dynamic>)
        .map((e) => Moto.fromJson(e as Map<String, dynamic>));
    final ids = (jsonDecode(File('assets/data/marcas.json').readAsStringSync())
            as List<dynamic>)
        .map((e) => Marca.fromJson(e as Map<String, dynamic>).id)
        .toSet();

    expect(motos.every((m) => ids.contains(m.marcaId)), isTrue);
  });
}
