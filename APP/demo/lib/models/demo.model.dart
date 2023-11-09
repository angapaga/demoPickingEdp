class Demo {
  final int id;
  final String modelo;
  final String qcodigo;
  
  const Demo({
    required this.id,
    required this.modelo,
    required this.qcodigo,
  });

  factory Demo.fromJson(Map<String, dynamic> json) {
    return Demo(
      id: json['id'] as int,
      modelo: json['modelo'] as String,
      qcodigo: json['qcodigo'] as String,
    );
  }
}