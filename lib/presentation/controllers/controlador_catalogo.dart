import 'package:flutter/foundation.dart';

import '../../data/models/marca.dart';
import '../../data/models/moto.dart';
import '../../data/services/servicio_motos.dart';

class ControladorCatalogo extends ChangeNotifier {
  final ServicioMotos _servicio;

  ControladorCatalogo(this._servicio);

  List<Moto> _motos = [];
  List<Marca> _marcas = [];
  final Set<int> _favoritos = {};
  bool cargando = true;
  String? error;
  String busqueda = '';
  String? categoriaSeleccionada;

  List<Moto> get motos => _motos;
  List<Marca> get marcas => _marcas;

  List<String> get categorias {
    final nombres = _motos.map((moto) => moto.categoria).toSet().toList();
    nombres.sort();
    return nombres;
  }

  List<Moto> get motosFiltradas {
    final texto = busqueda.trim().toLowerCase();
    return _motos.where((moto) {
      final coincideCategoria =
          categoriaSeleccionada == null ||
          moto.categoria == categoriaSeleccionada;
      final nombreMarca = marcaDe(moto.marcaId).nombre.toLowerCase();
      final coincideTexto =
          texto.isEmpty ||
          moto.modelo.toLowerCase().contains(texto) ||
          nombreMarca.contains(texto);
      return coincideCategoria && coincideTexto;
    }).toList();
  }

  List<Moto> get favoritas =>
      _motos.where((moto) => _favoritos.contains(moto.id)).toList();

  Future<void> cargar() async {
    cargando = true;
    error = null;
    notifyListeners();
    try {
      _motos = await _servicio.cargarMotos();
      _marcas = await _servicio.cargarMarcas();
    } catch (e) {
      error = 'No se pudo cargar el catálogo. Intenta de nuevo.';
    }
    cargando = false;
    notifyListeners();
  }

  Marca marcaDe(String marcaId) {
    return _marcas.firstWhere((marca) => marca.id == marcaId);
  }

  List<Moto> motosDeMarca(String marcaId) {
    return _motos.where((moto) => moto.marcaId == marcaId).toList();
  }

  bool esFavorita(int motoId) => _favoritos.contains(motoId);

  void alternarFavorito(int motoId) {
    if (!_favoritos.remove(motoId)) {
      _favoritos.add(motoId);
    }
    notifyListeners();
  }

  void buscar(String texto) {
    busqueda = texto;
    notifyListeners();
  }

  void seleccionarCategoria(String? categoria) {
    categoriaSeleccionada = categoria;
    notifyListeners();
  }
}
