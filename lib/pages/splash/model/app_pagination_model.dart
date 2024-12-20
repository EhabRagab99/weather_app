
class AppPaginationModel {
  final int statusCode;
  final String statusMessage;
  final List<Datum> data;

  AppPaginationModel({
    required this.statusCode,
    required this.statusMessage,
    required this.data,
  });

  factory AppPaginationModel.fromJson(Map<String, dynamic> json) => AppPaginationModel(
    statusCode: json["statusCode"]??0,
    statusMessage: json["statusMessage"]??"",
    data:json["data"]==null?[]: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );
}

class Datum {
  final String key;
  final int size;
  final String description;

  Datum({
    required this.key,
    required this.size,
    required this.description,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    key: json["key"]??"",
    size: json["size"]??10,
    description: json["description"]??"",
  );
}
