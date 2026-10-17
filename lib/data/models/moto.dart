class Moto {
  final int id;
  final String marcaId;
  final String modelo;
  final String categoria;
  final int anio;
  final int cilindrada;
  final double precio;
  final String imagen;
  final String descripcion;
  final List<String> colores;

  const Moto({
    required this.id,
    required this.marcaId,
    required this.modelo,
    required this.categoria,
    required this.anio,
    required this.cilindrada,
    required this.precio,
    required this.imagen,
    required this.descripcion,
    required this.colores,
  });

  bool get tieneImagen => imagen.isNotEmpty;

  factory Moto.fromJson(Map<String, dynamic> json) {
    return Moto(
      id: json['id'] as int,
      marcaId: json['marcaId'] as String,
      modelo: json['modelo'] as String,
      categoria: json['categoria'] as String,
      anio: json['anio'] as int,
      cilindrada: json['cilindrada'] as int,
      precio: (json['precio'] as num).toDouble(),
      imagen: json['imagen'] as String,
      descripcion: json['descripcion'] as String,
      colores: List<String>.from(json['colores'] as List),
    );
  }
}
