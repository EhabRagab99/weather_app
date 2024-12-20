class CountryModel {
  final int statusCode;
  final String statusMessage;
  final List<CountryItemModel> data;

  CountryModel({
    required this.statusCode,
    required this.statusMessage,
    required this.data,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
    statusCode: json["statusCode"]??-1,
    statusMessage: json["statusMessage"]??'',
    data:json["data"]!=null? List<CountryItemModel>.from(json["data"].map((x) => CountryItemModel.fromJson(x))):[],
  );

}

class CountryItemModel {
  final int id;
  final String name;
  final String phoneCode;
  final int phoneLength;
  final String hintText;
  final bool isLogin;
  final String twoLetterCode;
  final String threeLetterCode;
  bool isSelected;

  CountryItemModel({
    required this.id,
    required this.name,
    required this.phoneCode,
    required this.phoneLength,
    required this.hintText,
    required this.isLogin,
    this.isSelected=false,
    required this.twoLetterCode,
    required this.threeLetterCode,
  });

  factory CountryItemModel.fromJson(Map<String, dynamic> json) => CountryItemModel(
    id: json["id"]??-1,
    name: json["name"]??'',
    phoneCode: json["phoneCode"]??'',
    phoneLength: json["phoneLength"]??-1,
    hintText: json["hintText"]??'',
    isLogin: json["isLogin"]??false,
    twoLetterCode: json["twoLetterCode"]??'',
    threeLetterCode: json["threeLetterCode"]??'',
    isSelected: false,
  );

}
