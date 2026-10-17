import 'package:flutter/material.dart';

import '../controllers/controlador_catalogo.dart';
import '../widgets/barra_categorias.dart';
import '../widgets/campo_busqueda.dart';
import '../widgets/estado_vacio.dart';
import '../widgets/tarjeta_moto.dart';
import '../widgets/vista_carga.dart';
import '../widgets/vista_error.dart';
import 'pantalla_detalle_moto.dart';
import 'pantalla_favoritos.dart';
import 'pantalla_marcas.dart';

class PantallaCatalogo extends StatelessWidget {
  final ControladorCatalogo controlador;

  const PantallaCatalogo({super.key, required this.controlador});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Motos'),
        actions: [
          IconButton(
            tooltip: 'Marcas',
            icon: const Icon(Icons.store_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PantallaMarcas(controlador: controlador),
                ),
              );
            },
          ),
          IconButton(
            tooltip: 'Favoritos',
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PantallaFavoritos(controlador: controlador),
                ),
              );
            },
          ),
        ],
      ),
      body: ListenableBuilder(
        listenable: controlador,
        builder: (context, _) {
          if (controlador.cargando) {
            return const VistaCarga();
          }
          if (controlador.error != null) {
            return VistaError(
              mensaje: controlador.error!,
              alReintentar: controlador.cargar,
            );
          }
          final motos = controlador.motosFiltradas;
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
                child: CampoBusqueda(alCambiar: controlador.buscar),
              ),
              BarraCategorias(
                categorias: controlador.categorias,
                seleccionada: controlador.categoriaSeleccionada,
                alSeleccionar: controlador.seleccionarCategoria,
              ),
              const SizedBox(height: 8),
              Expanded(
                child: motos.isEmpty
                    ? const EstadoVacio(
                        icono: Icons.search_off,
                        titulo: 'Sin resultados',
                        mensaje: 'Prueba con otra búsqueda o quita los filtros.',
                      )
                    : ListView.separated(
                        padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
                        itemCount: motos.length,
                        separatorBuilder: (_, _) => const SizedBox(height: 14),
                        itemBuilder: (context, indice) {
                          final moto = motos[indice];
                          final marca = controlador.marcaDe(moto.marcaId);
                          return TarjetaMoto(
                            moto: moto,
                            nombreMarca: marca.nombre,
                            logoMarca: marca.logo,
                            esFavorita: controlador.esFavorita(moto.id),
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
                            alAlternarFavorito: () =>
                                controlador.alternarFavorito(moto.id),
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
