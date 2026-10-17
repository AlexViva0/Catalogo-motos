import 'package:flutter/material.dart';

import '../../core/theme/colores_app.dart';
import '../../core/utils/formato.dart';

class EtiquetaPrecio extends StatelessWidget {
  final double precio;

  const EtiquetaPrecio({super.key, required this.precio});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: ColoresApp.acentoClaro,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        formatearPrecio(precio),
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: ColoresApp.textoPrincipal,
        ),
      ),
    );
  }
}
