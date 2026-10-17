import 'package:flutter/material.dart';

import '../../core/theme/colores_app.dart';

class BotonFavorito extends StatelessWidget {
  final bool esFavorito;
  final VoidCallback alPresionar;

  const BotonFavorito({
    super.key,
    required this.esFavorito,
    required this.alPresionar,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withValues(alpha: 0.9),
      shape: const CircleBorder(),
      child: IconButton(
        onPressed: alPresionar,
        tooltip: esFavorito ? 'Quitar de favoritos' : 'Agregar a favoritos',
        icon: Icon(
          esFavorito ? Icons.favorite : Icons.favorite_border,
          color: esFavorito ? ColoresApp.error : ColoresApp.textoSecundario,
        ),
      ),
    );
  }
}
