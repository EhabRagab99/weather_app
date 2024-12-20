class CurrencyModel {
  final int statusCode;
  final String statusMessage;
  final Data data;

  CurrencyModel({
    required this.statusCode,
    required this.statusMessage,
    required this.data,
  });

  factory CurrencyModel.fromJson(Map<String, dynamic> json) => CurrencyModel(
    statusCode: json["statusCode"]??-1,
    statusMessage: json["statusMessage"]??'',
    data:json['data']!=null? Data.fromJson(json["data"]):Data.fromJson({}),
  );


}

class Data {
  final int id;
  final String name;
  final String code;
  final bool isDefault;
  final dynamic image;

  Data({
    required this.id,
    required this.name,
    required this.code,
    required this.isDefault,
    required this.image,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"]??-1,
    name: json["name"]??'',
    code: json["code"]??'',
    isDefault: json["isDefault"]??false,
    image: json["image"]??'',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "code": code,
    "isDefault": isDefault,
    "image": image,
  };
}