class ApiKeyModel {
  ApiKeyModel({
    required this.token,
    required this.key,
    this.decodedApiKey=''
  });

  String token;
  String key;
  String decodedApiKey;


  factory ApiKeyModel.fromJson(Map<String, dynamic> json) => ApiKeyModel(
    token: json["token"] ?? "",
    key: json["key"] ?? "",
  );
}




