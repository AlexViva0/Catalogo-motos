import 'package:flutter/material.dart';

import '../../core/theme/colores_app.dart';

class CampoBusqueda extends StatelessWidget {
  final String pista;
  final ValueChanged<String> alCambiar;

  const CampoBusqueda({
    super.key,
    required this.alCambiar,
    this.pista = 'Escribe un modelo o una marca',
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: alCambiar,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: pista,
        prefixIcon: const Icon(Icons.search, color: ColoresApp.textoSecundario),
      ),
    );
  }
}
