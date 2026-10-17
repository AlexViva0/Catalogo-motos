import 'package:flutter/material.dart';

import '../../core/theme/colores_app.dart';

class ImagenMoto extends StatelessWidget {
  final String url;
  final String rutaRespaldo;
  final double altura;

  const ImagenMoto({
    super.key,
    required this.url,
    required this.rutaRespaldo,
    this.altura = 180,
  });

  Widget _respaldo() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(24),
      child: Image.asset(rutaRespaldo, fit: BoxFit.contain),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: altura,
      width: double.infinity,
      child: url.isEmpty
          ? _respaldo()
          : Image.network(
              url,
              fit: BoxFit.cover,
              loadingBuilder: (context, hijo, progreso) {
                if (progreso == null) {
                  return hijo;
                }
                return const ColoredBox(
                  color: ColoresApp.acentoClaro,
                  child: Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: ColoresApp.primario,
                    ),
                  ),
                );
              },
              errorBuilder: (context, error, pila) => _respaldo(),
            ),
    );
  }
}
