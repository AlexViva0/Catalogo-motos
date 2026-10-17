import 'package:flutter/material.dart';

import '../../data/models/marca.dart';

class ChipMarca extends StatelessWidget {
  final Marca marca;
  final bool seleccionada;
  final VoidCallback alTocar;

  const ChipMarca({
    super.key,
    required this.marca,
    required this.seleccionada,
    required this.alTocar,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(marca.nombre),
      selected: seleccionada,
      onSelected: (_) => alTocar(),
    );
  }
}
