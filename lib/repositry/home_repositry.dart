import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
 import 'package:weather/data/network/api_services.dart';
import 'package:weather/res/app_url/app_url.dart';

class HomeReposirty {
  static var lat;
  static var lng;
  static Future<dynamic> hitApi() async {
    String addressName = "";
    if (await Permission.location.request().isGranted) {
      Position position =
          await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      // print("LAT : ${position.latitude}  LNG : ${position.longitude}");
      HomeReposirty.lat = position.latitude;
      HomeReposirty.lng = position.longitude;
      List<Placemark> addresses = await GeocodingPlatform.instance!.placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      var place = addresses[0];
      addressName = place.locality!;
      // print(" ${place}");
    }
    var response = await ApiServices().getApi(AppUrl.urlWeather(address: addressName));
    return response;
  }
}
