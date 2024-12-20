
class AppSettingByGroupModel {
  AppSettingByGroupModel({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  final int statusCode;
  final String message;
  final List<AppSettingItemModel> data;

  factory AppSettingByGroupModel.fromJson(Map<String, dynamic> json) => AppSettingByGroupModel(
    statusCode: json["statusCode"]??0,
    message: json["statusMessage"]??"",
    data: json["data"]!=null?List<AppSettingItemModel>.from(json["data"].map((x) => AppSettingItemModel.fromJson(x))):[],
  );
}

class AppSettingItemModel {
  AppSettingItemModel({
    required this.key,
    required this.subTitle,
    required this.description,
    required this.value,
    required this.endPoint,
  });

  final String key;
  final String subTitle;
  final String description;
  final String value;
  final String endPoint;

  factory AppSettingItemModel.fromJson(Map<String, dynamic> json) => AppSettingItemModel(
    key: json["key"]??"",
    subTitle: json["subTitle"]??"",
    description: json["description"]??"",
    value: json["value"]??"",
    endPoint: json["endpoint"]??"",
  );

}
