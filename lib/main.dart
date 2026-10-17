import 'package:flutter/material.dart';

import 'core/theme/tema_app.dart';
import 'data/services/servicio_motos.dart';
import 'presentation/controllers/controlador_catalogo.dart';
import 'presentation/screens/pantalla_catalogo.dart';

void main() {
  runApp(const AplicacionMotos());
}

class AplicacionMotos extends StatefulWidget {
  const AplicacionMotos({super.key});

  @override
  State<AplicacionMotos> createState() => _EstadoAplicacionMotos();
}

class _EstadoAplicacionMotos extends State<AplicacionMotos> {
  late final ControladorCatalogo _controlador;

  @override
  void initState() {
    super.initState();
    _controlador = ControladorCatalogo(ServicioMotos())..cargar();
  }

  @override
  void dispose() {
    _controlador.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catálogo de Motos',
      debugShowCheckedModeBanner: false,
      theme: TemaApp.claro,
      home: PantallaCatalogo(controlador: _controlador),
    );
  }
}
