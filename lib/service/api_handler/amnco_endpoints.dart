import 'package:flutter/material.dart';

enum MyUrl {
  basePreProdUrl,
  baseTestUrl,
  baseDevUrl,
  baseProduction,
}
class AmncoBaseServerUrl {
  AmncoBaseServerUrl._();
  // Here you can simply define your Current URL and it will be changed in all over the project 🚀
  static MyUrl singletonUrl = MyUrl.baseTestUrl;
  static final AmncoBaseServerUrl _instance = AmncoBaseServerUrl._();
  static AmncoBaseServerUrl get instance => _instance;
}
extension MyUrlClass on MyUrl {
  String get value {
    switch (this) {
      case MyUrl.basePreProdUrl:
        return 'http://api-preprod.amnco.com/';
      case MyUrl.baseTestUrl:
        return 'https://api.openweathermap.org/';
      case MyUrl.baseDevUrl:
        return 'https://amanco-new-be-dev.eden-tech.io/';
      case MyUrl.baseProduction:
        return 'https://api.amncooperations.com/';
    }
  }

  String get environmentName {
    switch (this) {
      case MyUrl.basePreProdUrl:
        return 'PRE-PROD';
      case MyUrl.baseTestUrl:
        return 'TEST';
      case MyUrl.baseDevUrl:
        return 'DEV';
      case MyUrl.baseProduction:
        return 'PRODUCT';
    }
  }

  Color get environmentColor {
    switch (this) {
      case MyUrl.basePreProdUrl:
        return Colors.amber;
      case MyUrl.baseTestUrl:
        return Colors.blue;
      case MyUrl.baseDevUrl:
        return Colors.red;
      case MyUrl.baseProduction:
        return Colors.green;
    }
  }
}

class AmncoEndPoints{

  static const String loginWorkforce = 'auth/login-workforce';
  static const String registerWorkforce = 'workforces';
  static const String getWorkforcePeriods = 'workforces/periods';
  static String getWorkforceAssignments({String orderBy = 'desc', int pageNumber = 1}) =>"workforces/assignments?orderBy=$orderBy&page=$pageNumber&take=10";
  // static const String checkInOut = 'attendance-logs';
  static const String postAssignmentFulfillment = 'assignment-fulfillment';
  static const String assignmentFulfillment = 'assignment-fulfillment/workforce/fulfilled-assignments';
  static const String addVisitor = 'workforces/visitors';
  static String getAllVisitors({String textToSearch = '', int pageNumber = 1}) =>"workforces/visitors?search=$textToSearch&page=$pageNumber&take=10";
  static String exitVisitor({required int visitorID}) =>"workforces/visitors/$visitorID/exit-time";
  static const String addIncidentCar = 'workforces-vehicles';
  static String getVehiclesTypes({String textToSearch = '', int pageNumber = 1}) => 'workforces-vehicles/types?search=$textToSearch&page=$pageNumber&take=10';
  static const String getIncidentReportCategories= 'workforces-incident-report/categories';
  static String getAllVehicles({String textToSearch = '', int pageNumber = 1}) =>"workforces-vehicles?search=$textToSearch&page=$pageNumber&take=10";
  static String exitCar({required int carID}) =>"workforces-vehicles/$carID/exit-time";
  static const String addIncidentReport= 'workforces-incident-report';
  static const String checkTaps= 'workforces-patrolling/check-tapes';
  static const String checkAc= 'workforces-patrolling/check-ac';
  static const String checkFireExtinguisher= 'workforces-patrolling/check-fire-extinguisher';
  // static String getAllVehiclePermissions({required int assignmentDetailsId, int pageNumber = 1, String textToSearch = '',}) =>"mobile-api/vehicle-permission?assignmentDetailsId=$assignmentDetailsId?search=$textToSearch&page=$pageNumber&take=10";
  static String getAllVehiclePermissions({required int assignmentDetailsId, int pageNumber = 1, String textToSearch = '',}) =>"mobile-api/vehicle-permission?assignmentDetailsId=$assignmentDetailsId";
  static String getVehiclePermissionsDetails({required int vehicleId,}) =>"mobile-api/vehicle-permission/$vehicleId";
  static String postFindVehicleIfHasPermissions ="mobile-api/vehicle-permission/find-attend";
  static String postAttendPermissibleVehicle({required int vehicleId,}) =>"mobile-api/vehicle-permission/$vehicleId/attend";
  static String postExitPermissibleVehicle({required int vehicleId,}) =>"mobile-api/vehicle-permission/$vehicleId/exit";

  static String getAllPermissibleVisitors({required int assignmentDetailsId, int pageNumber = 1, String textToSearch = '',}) =>"mobile-api/visitor-permission?assignmentDetailsId=$assignmentDetailsId";
  static String getVisitorPermissionsDetails({required int visitorId,}) =>"mobile-api/visitor-permission/$visitorId";
  static String postFindVisitorIfHasPermissions ="mobile-api/visitor-permission/find-attend";
  static String postAttendPermissibleVisitor({required int visitorId,}) =>"mobile-api/visitor-permission/$visitorId/attend";
  static String postExitPermissibleVisitor({required int visitorId,}) =>"mobile-api/visitor-permission/$visitorId/exit";



}
