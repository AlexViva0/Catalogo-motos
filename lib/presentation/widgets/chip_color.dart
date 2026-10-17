import 'package:flutter/material.dart';

import '../../core/theme/colores_app.dart';

class ChipColor extends StatelessWidget {
  final String nombre;

  const ChipColor({super.key, required this.nombre});

  static const Map<String, Color> _colores = {
    'Negro': Color(0xFF222222),
    'Azul': Color(0xFF2F6FB5),
    'Gris': Color(0xFF8C8C8C),
    'Rojo': Color(0xFFC0392B),
    'Blanco': Color(0xFFF5F5F5),
    'Verde': Color(0xFF3E8E41),
    'Naranja': Color(0xFFE67E22),
    'Amarillo': Color(0xFFF1C40F),
  };

  @override
  Widget build(BuildContext context) {
    final color = _colores[nombre] ?? ColoresApp.textoSecundario;
    return Chip(
      avatar: CircleAvatar(backgroundColor: color, radius: 8),
      label: Text(nombre),
      side: const BorderSide(color: ColoresApp.borde),
      backgroundColor: Colors.white,
    );
  }
}
