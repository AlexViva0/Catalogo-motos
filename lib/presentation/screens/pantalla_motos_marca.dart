import 'package:flutter/material.dart';

import '../../data/models/marca.dart';
import '../controllers/controlador_catalogo.dart';
import '../widgets/tarjeta_moto.dart';
import 'pantalla_detalle_moto.dart';

class PantallaMotosMarca extends StatelessWidget {
  final Marca marca;
  final ControladorCatalogo controlador;

  const PantallaMotosMarca({
    super.key,
    required this.marca,
    required this.controlador,
  });

  @override
  Widget build(BuildContext context) {
    final motos = controlador.motosDeMarca(marca.id);
    return Scaffold(
      appBar: AppBar(title: Text(marca.nombre)),
      body: ListenableBuilder(
        listenable: controlador,
        builder: (context, _) {
          return ListView(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 72,
                      height: 72,
                      child: Image.asset(marca.logo, fit: BoxFit.contain),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        marca.descripcion,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              for (final moto in motos) ...[
                TarjetaMoto(
                  moto: moto,
                  nombreMarca: marca.nombre,
                  logoMarca: marca.logo,
                  esFavorita: controlador.esFavorita(moto.id),
                  alTocar: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PantallaDetalleMoto(
                          moto: moto,
                          controlador: controlador,
                        ),
                      ),
                    );
                  },
                  alAlternarFavorito: () =>
                      controlador.alternarFavorito(moto.id),
                ),
                const SizedBox(height: 14),
              ],
            ],
          );
        },
      ),
    );
  }
}
