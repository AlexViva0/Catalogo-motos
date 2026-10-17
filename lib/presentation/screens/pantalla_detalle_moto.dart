import 'package:flutter/material.dart';

import '../../data/models/moto.dart';
import '../controllers/controlador_catalogo.dart';
import '../widgets/boton_favorito.dart';
import '../widgets/chip_color.dart';
import '../widgets/etiqueta_precio.dart';
import '../widgets/fila_especificacion.dart';
import '../widgets/imagen_moto.dart';

class PantallaDetalleMoto extends StatelessWidget {
  final Moto moto;
  final ControladorCatalogo controlador;

  const PantallaDetalleMoto({
    super.key,
    required this.moto,
    required this.controlador,
  });

  @override
  Widget build(BuildContext context) {
    final marca = controlador.marcaDe(moto.marcaId);
    return Scaffold(
      appBar: AppBar(
        title: Text(moto.modelo, maxLines: 1, overflow: TextOverflow.ellipsis),
        actions: [
          ListenableBuilder(
            listenable: controlador,
            builder: (context, _) => BotonFavorito(
              esFavorito: controlador.esFavorita(moto.id),
              alPresionar: () => controlador.alternarFavorito(moto.id),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImagenMoto(
              url: moto.imagen,
              rutaRespaldo: marca.logo,
              altura: 240,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    marca.nombre.toUpperCase(),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    moto.modelo,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 12),
                  EtiquetaPrecio(precio: moto.precio),
                  const SizedBox(height: 16),
                  Text(
                    moto.descripcion,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Especificaciones',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  FilaEspecificacion(
                    icono: Icons.speed,
                    titulo: 'Cilindrada',
                    valor: '${moto.cilindrada} cc',
                  ),
                  FilaEspecificacion(
                    icono: Icons.calendar_today_outlined,
                    titulo: 'Año',
                    valor: '${moto.anio}',
                  ),
                  FilaEspecificacion(
                    icono: Icons.category_outlined,
                    titulo: 'Categoría',
                    valor: moto.categoria,
                  ),
                  FilaEspecificacion(
                    icono: Icons.public,
                    titulo: 'Marca',
                    valor: '${marca.nombre} · ${marca.pais}',
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Colores disponibles',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children: [
                      for (final color in moto.colores) ChipColor(nombre: color),
                    ],
                  ),
                  const SizedBox(height: 28),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('Volver'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
