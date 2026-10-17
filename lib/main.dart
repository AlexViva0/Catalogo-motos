import 'package:flutter/material.dart';

import 'core/theme/tema_app.dart';

void main() {
  runApp(const AplicacionMotos());
}

class AplicacionMotos extends StatelessWidget {
  const AplicacionMotos({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catálogo de Motos',
      debugShowCheckedModeBanner: false,
      theme: TemaApp.claro,
      home: Scaffold(
        appBar: AppBar(title: const Text('Catálogo de Motos')),
        body: const Center(child: Text('Tema verde aplicado')),
      ),
    );
  }
}
