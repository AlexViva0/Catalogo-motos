import 'package:flutter/material.dart';

import '../controllers/controlador_catalogo.dart';
import '../widgets/estado_vacio.dart';
import '../widgets/tarjeta_moto.dart';
import 'pantalla_detalle_moto.dart';

class PantallaFavoritos extends StatelessWidget {
  final ControladorCatalogo controlador;

  const PantallaFavoritos({super.key, required this.controlador});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favoritos')),
      body: ListenableBuilder(
        listenable: controlador,
        builder: (context, _) {
          final motos = controlador.favoritas;
          if (motos.isEmpty) {
            return const EstadoVacio(
              icono: Icons.favorite_border,
              titulo: 'Tu lista está vacía',
              mensaje: 'Toca el corazón de una moto y aparecerá en esta lista.',
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            itemCount: motos.length,
            separatorBuilder: (_, _) => const SizedBox(height: 14),
            itemBuilder: (context, indice) {
              final moto = motos[indice];
              final marca = controlador.marcaDe(moto.marcaId);
              return TarjetaMoto(
                moto: moto,
                nombreMarca: marca.nombre,
                logoMarca: marca.logo,
                esFavorita: true,
                alTocar: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PantallaDetalleMoto(
                        moto: moto,
                        controlador: controlador,
                      ),
                    ),
                  );
                },
                alAlternarFavorito: () => controlador.alternarFavorito(moto.id),
              );
            },
          );
        },
      ),
    );
  }
}
