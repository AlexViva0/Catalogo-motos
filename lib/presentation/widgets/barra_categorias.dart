import 'package:flutter/material.dart';

class BarraCategorias extends StatelessWidget {
  final List<String> categorias;
  final String? seleccionada;
  final ValueChanged<String?> alSeleccionar;

  const BarraCategorias({
    super.key,
    required this.categorias,
    required this.seleccionada,
    required this.alSeleccionar,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ChoiceChip(
              label: const Text('Todas'),
              selected: seleccionada == null,
              onSelected: (_) => alSeleccionar(null),
            ),
          ),
          for (final categoria in categorias)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ChoiceChip(
                label: Text(categoria),
                selected: seleccionada == categoria,
                onSelected: (_) => alSeleccionar(categoria),
              ),
            ),
        ],
      ),
    );
  }
}
