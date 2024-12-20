class CurrenciesModel {
  final int statusCode;
  final String statusMessage;
  final List<CurrenciesModelValueModel> data;

  CurrenciesModel({
    required this.statusCode,
    required this.statusMessage,
    required this.data,
  });

  factory CurrenciesModel.fromJson(Map<String, dynamic> json) => CurrenciesModel(
    statusCode: json["statusCode"]??-1,
    statusMessage: json["statusMessage"]??'',
    data:json['data']!=null? List<CurrenciesModelValueModel>.from(json["data"].map((x) => CurrenciesModelValueModel.fromJson(x))):[],
  );


}

class CurrenciesModelValueModel {
  final int id;
  final String name;
  final String code;
  bool isDefault;
  final dynamic image;

  CurrenciesModelValueModel({
    required this.id,
    required this.name,
    required this.code,
    required this.isDefault,
    required this.image,
  });

  factory CurrenciesModelValueModel.fromJson(Map<String, dynamic> json) => CurrenciesModelValueModel(
    id: json["id"]??-1,
    name: json["name"]??'',
    code: json["code"]??'',
    isDefault: json["isDefault"]??false,
    image: json["image"]??'',
  );

}
