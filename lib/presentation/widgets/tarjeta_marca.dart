import 'package:flutter/material.dart';

import '../../core/theme/colores_app.dart';
import '../../data/models/marca.dart';

class TarjetaMarca extends StatelessWidget {
  final Marca marca;
  final int cantidadMotos;
  final VoidCallback alTocar;

  const TarjetaMarca({
    super.key,
    required this.marca,
    required this.cantidadMotos,
    required this.alTocar,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: alTocar,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              Container(
                width: 72,
                height: 72,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Image.asset(marca.logo, fit: BoxFit.contain),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      marca.nombre,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${marca.pais} · $cantidadMotos motos',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: ColoresApp.textoSecundario,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
