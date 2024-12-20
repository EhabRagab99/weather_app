class OsVersionModel {
  OsVersionModel({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  int statusCode;
  String message;
  Data data;

  factory OsVersionModel.fromJson(Map<String, dynamic> json) => OsVersionModel(
        statusCode: json["statusCode"] ?? 0,
        message: json["message"] ?? "",
        data: Data.fromJson(json["data"] ?? {}),
      );
}

class Data {
  Data({
    required this.android,
    required this.iOs,
  });

  Android android;
  Android iOs;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        android: Android.fromJson(json["Android"] ?? {}),
        iOs: Android.fromJson(json["IOS"] ?? {}),
      );
}

class Android {
  Android({
    required this.version,
    required this.force,
  });

  String version;
  bool force;

  factory Android.fromJson(Map<String, dynamic> json) => Android(
        version: json["version"] ?? "",
        force: json["force"] ?? false,
      );
}
