class ApiResponse {
  ApiResponse({
    required this.success,
    required this.error,
    required this.code,
  });

  late final String success;
  late final String? error;
  late final int code;

  ApiResponse.fromJson(Map<String, dynamic> json) {
    success = json['message'];
    error = json['error'];
    code = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['error'] = error;
    _data['code'] = code;
    return _data;
  }
}
