import 'package:flutter/material.dart';

import '../../core/theme/colores_app.dart';

class VistaCarga extends StatelessWidget {
  final String mensaje;

  const VistaCarga({super.key, this.mensaje = 'Cargando motos...'});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(color: ColoresApp.primario),
          const SizedBox(height: 16),
          Text(mensaje, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
