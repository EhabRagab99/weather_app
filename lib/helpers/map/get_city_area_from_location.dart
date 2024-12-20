// import 'package:geocoding/geocoding.dart';
//
// class GetCityAndAreaFromLocation{
//
//   Future<Placemark> getCityAndArea({required String localeIdentifier,required double latitude,required double longitude,})async{
//     List<Placemark> addresses;
//
//     addresses=await placemarkFromCoordinates(
//       latitude,
//       longitude,
//       localeIdentifier: localeIdentifier,
//     ).then((value)async {
//       return value;
//     });
//
//     return addresses.first;
//
//   }
// }