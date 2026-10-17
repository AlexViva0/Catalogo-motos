class Marca {
  final String id;
  final String nombre;
  final String pais;
  final String logo;
  final String descripcion;

  const Marca({
    required this.id,
    required this.nombre,
    required this.pais,
    required this.logo,
    required this.descripcion,
  });

  factory Marca.fromJson(Map<String, dynamic> json) {
    return Marca(
      id: json['id'] as String,
      nombre: json['nombre'] as String,
      pais: json['pais'] as String,
      logo: json['logo'] as String,
      descripcion: json['descripcion'] as String,
    );
  }
}
