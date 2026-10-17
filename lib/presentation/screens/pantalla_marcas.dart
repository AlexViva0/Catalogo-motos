import 'package:flutter/material.dart';

import '../controllers/controlador_catalogo.dart';
import '../widgets/tarjeta_marca.dart';
import 'pantalla_motos_marca.dart';

class PantallaMarcas extends StatelessWidget {
  final ControladorCatalogo controlador;

  const PantallaMarcas({super.key, required this.controlador});

  @override
  Widget build(BuildContext context) {
    final marcas = controlador.marcas;
    return Scaffold(
      appBar: AppBar(title: const Text('Marcas')),
      body: ListView.separated(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        itemCount: marcas.length,
        separatorBuilder: (_, _) => const SizedBox(height: 12),
        itemBuilder: (context, indice) {
          final marca = marcas[indice];
          return TarjetaMarca(
            marca: marca,
            cantidadMotos: controlador.motosDeMarca(marca.id).length,
            alTocar: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PantallaMotosMarca(
                    marca: marca,
                    controlador: controlador,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
