class NetworkResponse {
  final bool isSuccess;
  final int statusCode;
  final Map<String, dynamic>? body;

  NetworkResponse({
    required this.isSuccess,
    required this.statusCode,
    this.body,
  });
}
