import 'package:flutter/material.dart';

import '../../core/theme/colores_app.dart';

class VistaError extends StatelessWidget {
  final String mensaje;
  final VoidCallback alReintentar;

  const VistaError({
    super.key,
    required this.mensaje,
    required this.alReintentar,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 56, color: ColoresApp.error),
            const SizedBox(height: 16),
            Text(
              mensaje,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: alReintentar,
              child: const Text('Intentar otra vez'),
            ),
          ],
        ),
      ),
    );
  }
}
