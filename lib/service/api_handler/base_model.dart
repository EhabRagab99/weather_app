class BaseResponseModel {
    int? statusCode;
    String? message;

  BaseResponseModel.fromJson(Map<String, dynamic> json) {
    statusCode = json["statusCode"] ?? -1;
    message = json["message"] ?? "";
  }
}
