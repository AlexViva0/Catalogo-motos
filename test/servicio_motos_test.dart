import 'package:flutter_test/flutter_test.dart';

import 'package:catalogo_motos/data/services/servicio_motos.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final servicio = ServicioMotos();

  test('cargarMotos lee las 12 motos del JSON local', () async {
    final motos = await servicio.cargarMotos();

    expect(motos.length, 12);
    expect(motos.first.modelo, 'MT-07');
    expect(motos.last.modelo, 'Z400');
  });

  test('cargarMarcas lee las 6 marcas del JSON local', () async {
    final marcas = await servicio.cargarMarcas();

    expect(marcas.length, 6);
    expect(marcas.first.nombre, 'Yamaha');
  });

  test('las motos y las marcas se pueden relacionar por marcaId', () async {
    final motos = await servicio.cargarMotos();
    final marcas = await servicio.cargarMarcas();
    final ids = marcas.map((marca) => marca.id).toSet();

    expect(motos.every((moto) => ids.contains(moto.marcaId)), isTrue);
  });
}
