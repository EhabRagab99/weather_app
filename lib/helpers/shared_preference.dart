// import 'package:shared_preferences/shared_preferences.dart';
//
// class UserDataFromStorage {
//   static late bool firstTime;
//   static late bool userIsGuest;
//   static late bool themeIsDarkMode;
//   static late String userPhoneTypeFromStorage;
//   static String languageCodeFromStorage = 'ar';
//   static int languageIdFromStorage = 1;
//   static String languageNameFromStorage = "langArabic";
//
//   static String userDstatic int userSignUpResendCount=1;ataBlockTime='null';
//
//   static bool  userIsBlocked=false;
//
//
//
//   static late int userIdFromStorage;
//   static late String firstNameFromStorage;
//   static late String lastNameFromStorage;
//   static late String phoneNumberFromStorage;
//   static late String userEmileFromStorage;
//   static late String userTokenFromStorage;
//
//   static late String currencyFromStorage;
//   static late String currencyCodeFromStorage;
//
//   static late int userTypeFromStorage;
//   static late int authTypeFromStorage;
//   static late int countryIdFromStorage;
//   static late String countryNameFromStorage;
//   static late String userCountryCodeFromStorage;
//   static late String dateOfBirthFromStorage;
//   static late String userImageFromStorage;
//   static late bool allowNotifications;
//   static late bool profileIsPublishedFromStorage;
//
//   static late int signInClickCountFromStorage;
//   static late int verifySignUpSeekerClickCount;
//   static late int verifySignUpRecruiterClickCount;
//   static late int verifyForgetPasswordClickCount;
//   static late int forgetPasswordEmailClickCount;
//   static late int changePasswordEmailClickCount;
//
//   static late String signInLimitDateFromStorage;
//   static late String verifySignUpSeekerLimitDate;
//   static late String verifySignUpRecruiterLimitDate;
//   static late String verifyForgetPasswordLimitDate;
//   static late String forgetPasswordEmailLimitDate;
//   static late String changePasswordEmailLimitDate;
//
//   static late List<int> wishlistProductsIds;
//   static late List<int> compareProductsIds;
//
//   static setFirstTimeApp(bool value) {
//     firstTime = value;
//     _setData();
//   }
//
//   static setCurrency(String value) {
//     currencyFromStorage = value;
//     _setData();
//   }
//
//   static setCurrencyCode(String value) {
//     currencyCodeFromStorage = value;
//     _setData();
//   }
//
//   static setIsPublished(bool value) {
//     profileIsPublishedFromStorage = value;
//     _setData();
//   }
//
//   static setSignInClickCount(int count) {
//     signInClickCountFromStorage = count;
//     _setData();
//   }
//
//   static setForgetPasswordClickCount(int count) {
//     forgetPasswordEmailClickCount = count;
//     _setData();
//   }
//
//   static setChangePasswordClickCount(int count) {
//     changePasswordEmailClickCount = count;
//     _setData();
//   }
//
//   static setUserId(int count) {
//     userIdFromStorage = count;
//     _setData();
//   }
//   static setUserBlockTime(String time) {
//     userDataBlockTime = time;
//     _setData();
//   }
//
//   static setUserResendOtpCount(int count) {
//     userSignUpResendCount = count;
//     _setData();
//   }
//
//   static setUserBlocked(bool value) {
//     userIsBlocked = value;
//     _setData();
//   }
//   static setUserType(int count) {
//     userTypeFromStorage = count;
//     _setData();
//   }
//   static setAuthType(int count) {
//     authTypeFromStorage = count;
//     _setData();
//   }
//   static setCountryId(int count) {
//     countryIdFromStorage = count;
//     _setData();
//   }
//
//   static setCountryName(String value) {
//     countryNameFromStorage = value;
//     _setData();
//   }
//
//   static setDateOfBirth(String value) {
//     dateOfBirthFromStorage = value;
//     _setData();
//   }
//
//   static setVerifySignUpSeekerClickCount(int count) {
//     verifySignUpSeekerClickCount = count;
//     _setData();
//   }
//
//   static setVerifySignUpRecruiterClickCount(int count) {
//     verifySignUpRecruiterClickCount = count;
//     _setData();
//   }
//
//   static setVerifyForgetPasswordClickCount(int count) {
//     verifyForgetPasswordClickCount = count;
//     _setData();
//   }
//
//   static setSignInLimitDateFromStorage(String value) {
//     signInLimitDateFromStorage = value;
//     _setData();
//   }
//
//   static setChangePasswordLimitDateFromStorage(String value) {
//     changePasswordEmailLimitDate = value;
//     _setData();
//   }
//
//   static setForgetPasswordEmailLimitDate(String value) {
//     forgetPasswordEmailLimitDate = value;
//     _setData();
//   }
//
//   static setVerifySignUpSeekerLimitDate(String value) {
//     verifySignUpSeekerLimitDate = value;
//     _setData();
//   }
//
//   static setVerifySignUpRecruiterLimitDate(String value) {
//     verifySignUpRecruiterLimitDate = value;
//     _setData();
//   }
//
//   static setVerifyForgetPasswordLimitDate(String value) {
//     verifyForgetPasswordLimitDate = value;
//     _setData();
//   }
//
//   static setUserIsGuest(bool block) {
//     userIsGuest = block;
//     _setData();
//   }
//
//   static setThemeIsDarkMode(bool darkMode) {
//     themeIsDarkMode = darkMode;
//     _setData();
//   }
//
//   static setPhoneType(String value) {
//     userPhoneTypeFromStorage = value;
//     _setData();
//   }
//
//   static setAppLanguageName(String value) {
//     languageNameFromStorage = value;
//     _setData();
//   }
//   static setAppLanguageCode(String value) {
//     languageCodeFromStorage = value;
//     _setData();
//   }
//   static setAppLanguageId(int value) {
//     languageIdFromStorage = value;
//     _setData();
//   }
//
//   static setUserCountryCode(String value) {
//     userCountryCodeFromStorage = value;
//     _setData();
//   }
//
//
//
//
//
//   static setUserImage(String value) {
//     userImageFromStorage = value;
//     _setData();
//   }
//
//   static setFirstName(String value) {
//     firstNameFromStorage = value;
//     _setData();
//   }
//
//   static setLastName(String value) {
//     lastNameFromStorage = value;
//     _setData();
//   }
//
//   static setAllowNotifications(bool allow) {
//     allowNotifications = allow;
//     _setData();
//   }
//
//   static setToken(String value) {
//     userTokenFromStorage = value;
//     _setData();
//   }
//
//   static setEmail(String value) {
//     userEmileFromStorage = value;
//     _setData();
//   }
//
//   static setPhoneNumber(String value) {
//     phoneNumberFromStorage = value;
//     _setData();
//   }
//
//   static addToWishlistProductsIds(int productId) {
//     wishlistProductsIds.add(productId);
//     _setData();
//   }
//
//   static removeProductIDFromWishlist(int productId) {
//     wishlistProductsIds.remove(productId);
//     _setData();
//   }
//
//   static addToCompareProductsIds(int productId) {
//     compareProductsIds.add(productId);
//     _setData();
//   }
//
//   static removeProductIDFromCompare(int productId) {
//     compareProductsIds.remove(productId);
//     _setData();
//   }
//
//   /// this function to remove all storage
//   static removeAllDataFromStorage() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.clear();
//   }
//
//   /// this function to remove any data from local storage by key
//   static removeDataFromStorage(String key) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove(key);
//   }
//
//   //#region private
//   static void _setData() async {
//     final prefs = await SharedPreferences.getInstance();
//     prefs.setBool("userIsGuest", userIsGuest);
//     prefs.setBool("firstTime", firstTime);
//     prefs.setBool("themeIsDarkMode", themeIsDarkMode);
//     prefs.setString("userImageFromStorage", userImageFromStorage);
//     prefs.setString("languageCodeFromStorage", languageCodeFromStorage);
//     prefs.setInt("languageIdFromStorage", languageIdFromStorage);
//     prefs.setString("languageNameFromStorage", languageNameFromStorage);
//     prefs.setString("firstNameFromStorage", firstNameFromStorage);
//     prefs.setString("userTokenFromStorage", userTokenFromStorage);
//     prefs.setString("phoneNumberFromStorage", phoneNumberFromStorage);
//     prefs.setString("lastNameFromStorage", lastNameFromStorage);
//     prefs.setString("userEmileFromStorage", userEmileFromStorage);
//     prefs.setBool("allowNotifications", allowNotifications);
//     prefs.setString("userCountryCodeFromStorage", userCountryCodeFromStorage);
//     prefs.setInt("signInClickCountFromStorage", signInClickCountFromStorage);
//     prefs.setInt("verifySignUpSeekerClickCount", verifySignUpSeekerClickCount);
//     prefs.setInt("verifySignUpRecruiterClickCount", verifySignUpRecruiterClickCount);
//     prefs.setInt("verifyForgetPasswordClickCount", verifyForgetPasswordClickCount);
//     prefs.setInt("forgetPasswordEmailClickCount", forgetPasswordEmailClickCount);
//     prefs.setInt("changePasswordEmailClickCount", changePasswordEmailClickCount);
//     prefs.setString("signInLimitDateFromStorage", signInLimitDateFromStorage);
//     prefs.setString("verifySignUpSeekerLimitDate", verifySignUpSeekerLimitDate);
//     prefs.setString("verifySignUpRecruiterLimitDate", verifySignUpRecruiterLimitDate);
//     prefs.setString("verifyForgetPasswordLimitDate", verifyForgetPasswordLimitDate);
//     prefs.setString("forgetPasswordEmailLimitDate", forgetPasswordEmailLimitDate);
//     prefs.setString("changePasswordEmailLimitDate", changePasswordEmailLimitDate);
//     prefs.setString("currencyFromStorage", currencyFromStorage);
//     prefs.setString("currencyCodeFromStorage", currencyCodeFromStorage);
//
//     prefs.setInt("userIdFromStorage", userIdFromStorage);
//     prefs.setString("userDataBlockTime", userDataBlockTime);
//     prefs.setInt("userSignUpResendCount", userSignUpResendCount);
//     prefs.setBool("userIsBlocked", userIsBlocked);
//     prefs.setInt("countryIdFromStorage", countryIdFromStorage);
//     prefs.setInt("userTypeFromStorage", userTypeFromStorage);
//     prefs.setInt("authTypeFromStorage", authTypeFromStorage);
//     prefs.setString("countryNameFromStorage", countryNameFromStorage);
//     prefs.setString("dateOfBirthFromStorage", dateOfBirthFromStorage);
//     prefs.setBool("profileIsPublishedFromStorage", profileIsPublishedFromStorage);
//     prefs.setStringList('wishlistProductsIds', wishlistProductsIds.map((productID) => productID.toString()).toList());
//     prefs.setStringList('compareProductsIds', compareProductsIds.map((productID) => productID.toString()).toList());
//
//   }
//
//   static getData() async {
//     final prefs = await SharedPreferences.getInstance();
//     userIsGuest = prefs.getBool("userIsGuest") ?? true;
//     firstTime = prefs.getBool("firstTime") ?? true;
//     themeIsDarkMode = prefs.getBool("themeIsDarkMode") ?? false;
//     languageCodeFromStorage = prefs.getString("languageCodeFromStorage") ?? 'ar';
//     languageIdFromStorage = prefs.getInt("languageIdFromStorage") ?? 1;
//     languageNameFromStorage = prefs.getString("languageNameFromStorage") ?? 'langArabic';
//     userCountryCodeFromStorage = prefs.getString("userCountryCodeFromStorage") ?? '+2';
//     userImageFromStorage = prefs.getString("userImageFromStorage") ?? '';
//     userPhoneTypeFromStorage = prefs.getString("userPhoneTypeFromStorage") ?? '';
//     firstNameFromStorage = prefs.getString("firstNameFromStorage") ?? '';
//     userTokenFromStorage = prefs.getString("userTokenFromStorage") ?? 'null';
//     phoneNumberFromStorage = prefs.getString("phoneNumberFromStorage") ?? '';
//     lastNameFromStorage = prefs.getString("lastNameFromStorage") ?? '';
//     userEmileFromStorage = prefs.getString("userEmileFromStorage") ?? '';
//     allowNotifications = prefs.getBool("allowNotifications") ?? true;
//     currencyFromStorage=prefs.getString('currencyFromStorage')??'';
//     currencyCodeFromStorage=prefs.getString('currencyCodeFromStorage')??'';
//     signInClickCountFromStorage = prefs.getInt("signInClickCountFromStorage") ?? 0;
//     verifySignUpSeekerClickCount = prefs.getInt("verifySignUpSeekerClickCount") ?? 0;
//     verifySignUpRecruiterClickCount = prefs.getInt("verifySignUpRecruiterClickCount") ?? 0;
//     verifyForgetPasswordClickCount = prefs.getInt("verifyForgetPasswordClickCount") ?? 0;
//     forgetPasswordEmailClickCount = prefs.getInt("forgetPasswordEmailClickCount") ?? 0;
//     changePasswordEmailClickCount = prefs.getInt("changePasswordEmailClickCount") ?? 0;
//     signInLimitDateFromStorage = prefs.getString("signInLimitDateFromStorage") ?? DateTime.now().toString();
//     verifySignUpSeekerLimitDate = prefs.getString("verifySignUpSeekerLimitDate") ?? DateTime.now().toString();
//     verifySignUpRecruiterLimitDate = prefs.getString("verifySignUpRecruiterLimitDate") ?? DateTime.now().toString();
//     verifyForgetPasswordLimitDate = prefs.getString("verifyForgetPasswordLimitDate") ?? DateTime.now().toString();
//     forgetPasswordEmailLimitDate = prefs.getString("forgetPasswordEmailLimitDate") ?? DateTime.now().toString();
//     changePasswordEmailLimitDate = prefs.getString("changePasswordEmailLimitDate") ?? DateTime.now().toString();
//
//     userIdFromStorage = prefs.getInt("userIdFromStorage") ?? 0;
//     userDataBlockTime = prefs.getString("userDataBlockTime") ?? 'null';
//     userSignUpResendCount = prefs.getInt("userSignUpResendCount") ?? 1;
//     userIsBlocked = prefs.getBool("userIsBlocked") ?? false;
//     countryIdFromStorage = prefs.getInt("countryIdFromStorage") ?? 0;
//     userTypeFromStorage = prefs.getInt("userTypeFromStorage") ?? 0;
//     authTypeFromStorage = prefs.getInt("authTypeFromStorage") ?? 0;
//     countryNameFromStorage = prefs.getString("countryNameFromStorage") ?? "";
//     dateOfBirthFromStorage = prefs.getString("dateOfBirthFromStorage") ?? DateTime.now().toString();
//     profileIsPublishedFromStorage = prefs.getBool("profileIsPublishedFromStorage") ?? false;
//     wishlistProductsIds= prefs.getStringList('wishlistProductsIds')?.map(int.parse).toList()??[];
//     compareProductsIds= prefs.getStringList('compareProductsIds')?.map(int.parse).toList()??[];
//
//   }
//
// //#endregion
// }
