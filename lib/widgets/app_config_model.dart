class AppConfigModel {
  AppConfigModel({
    required this.colors,
  });

  final Colors colors;

  factory AppConfigModel.fromJson(Map<String, dynamic> json) => AppConfigModel(
        colors: Colors.fromJson(json["colors"] ?? {}),
      );
}

class Colors {
  Colors({
    required this.lightMode,
    required this.darkMode,
  });

  final Mode lightMode;
  final Mode darkMode;

  factory Colors.fromJson(Map<String, dynamic> json) => Colors(
        lightMode: Mode.fromJson(json["light_mode"] ?? {}),
        darkMode: Mode.fromJson(json["dark_mode"] ?? {}),
      );
}

class Mode {
  Mode({
    required this.appBar,
    required this.primaryAndScaffold,
    required this.divider,
    required this.theme,
  });

  final AppBar appBar;
  final PrimaryAndScaffold primaryAndScaffold;
  final Divider divider;
  final Theme theme;

  factory Mode.fromJson(Map<String, dynamic> json) => Mode(
        appBar: AppBar.fromJson(json["app_bar"] ?? {}),
        primaryAndScaffold:
            PrimaryAndScaffold.fromJson(json["primary_and_scaffold"] ?? {}),
        divider: Divider.fromJson(json["divider"] ?? {}),
        theme: Theme.fromJson(json["theme"] ?? {}),
      );
}

class AppBar {
  AppBar({
    required this.appbarBackground,
  });

  final String appbarBackground;

  factory AppBar.fromJson(Map<String, dynamic> json) => AppBar(
        appbarBackground: json["appbarBackground"] ?? "#FFFFFF",
      );
}

class Divider {
  Divider({
    required this.dividerColor,
  });

  final String dividerColor;

  factory Divider.fromJson(Map<String, dynamic> json) => Divider(
        dividerColor: json["dividerColor"] ?? "#BCBCBC",
      );
}

class PrimaryAndScaffold {
  PrimaryAndScaffold({
    required this.primaryColor,
    required this.secondaryColor,
    required this.scaffoldBackgroundColor,
  });

  final String primaryColor;
  final String secondaryColor;
  final String scaffoldBackgroundColor;

  factory PrimaryAndScaffold.fromJson(Map<String, dynamic> json) =>
      PrimaryAndScaffold(
        primaryColor: json["primaryColor"] ?? "#F86B34",
        secondaryColor: json["secondaryColor"] ?? "#312B29",
        scaffoldBackgroundColor: json["scaffoldBackgroundColor"] ?? "#FFFFFF",
      );
}

class Theme {
  Theme(
      {required this.whiteColor,
      required this.blackColor,
      required this.greyColor,
      required this.redColor,
      required this.greyBlackColor,
      required this.greyLightColor,
      required this.greenColor,
      required this.yellowColor,
      required this.blueColor,
      });

  final String whiteColor;
  final String greyBlackColor;
  final String blackColor;
  final String greyColor;
  final String redColor;
  final String greyLightColor;
  final String greenColor;
  final String yellowColor;
  final String blueColor;


  factory Theme.fromJson(Map<String, dynamic> json) => Theme(
        whiteColor: json["whiteColor"] ?? "#ffffff",
        greyBlackColor: json['greyBlackColor'] ?? '#83807F',
        blackColor: json["blackColor"] ?? "#000000",
        greyColor: json["greyColor"] ?? "#BCBCBC",
        redColor: json["redColor"] ?? "#F83434",
        greyLightColor: json["greyLightColor"] ?? "#BCBCBC",
        greenColor: json["greenColor"] ?? "#07C564",
        yellowColor:json['yellowColor']?? "#FFC107",
        blueColor:json['blueColor']?? "#0000FF"
      );
}

