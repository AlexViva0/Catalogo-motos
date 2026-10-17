import 'package:flutter/material.dart';

import '../../core/theme/colores_app.dart';
import '../../data/models/moto.dart';
import 'boton_favorito.dart';
import 'etiqueta_precio.dart';
import 'imagen_moto.dart';

class TarjetaMoto extends StatelessWidget {
  final Moto moto;
  final String nombreMarca;
  final String logoMarca;
  final bool esFavorita;
  final VoidCallback alTocar;
  final VoidCallback alAlternarFavorito;

  const TarjetaMoto({
    super.key,
    required this.moto,
    required this.nombreMarca,
    required this.logoMarca,
    required this.esFavorita,
    required this.alTocar,
    required this.alAlternarFavorito,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: alTocar,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ImagenMoto(url: moto.imagen, rutaRespaldo: logoMarca),
                Positioned(
                  top: 8,
                  right: 8,
                  child: BotonFavorito(
                    esFavorito: esFavorita,
                    alPresionar: alAlternarFavorito,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nombreMarca.toUpperCase(),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    moto.modelo,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      EtiquetaPrecio(precio: moto.precio),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          '${moto.cilindrada} cc · ${moto.categoria}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 13,
                            color: ColoresApp.textoSecundario,
                          ),
                        ),
                      ),
                    ],
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
