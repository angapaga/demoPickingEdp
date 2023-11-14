class Demo {
  final int id;
  final int idmovimiento;
  final String cbarra;
  final String estado;
  
  const Demo({
    required this.id,
    required this.idmovimiento,
    required this.cbarra,
    required this.estado,
  });

  factory Demo.fromJson(Map<String, dynamic> json) {
    return Demo(
      id: json['id'] as int,
      idmovimiento: json['idmovimiento'] as int,
      cbarra: json['cbarra'] as String,
      estado: json['estado'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idmovimiento': idmovimiento,
      'cbarra': cbarra,
      'estado': cbarra,
    };
  }

}

// class DemoListResult {
//   final int code;
//   final String message;
//   final List<Demo> result;
  
//   const DemoListResult({
//     required this.code,
//     required this.message,
//     required this.result,
//   });

//   factory DemoListResult.fromJson(Map<String, dynamic> json) {
//     return DemoListResult(
//       code: json['code'] as int,
//       message: json['message'] as String,
//       result: json['result'] as List<Demo>,
//     );
//   }
// }