class ApiResponse {
  final bool success;
  final dynamic data;

  ApiResponse({
    required this.success,
    this.data,
  });
}

class ApiItmes {
  final List<dynamic> items;
  final String? nextToken;

  ApiItmes({
    required this.items,
    this.nextToken,
  });

  factory ApiItmes.fromJson(Map<String, dynamic> json) {
    return ApiItmes(
      items: json['items'],
      nextToken: json['nextToken'],
    );
  }
}
