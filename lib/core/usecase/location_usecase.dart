import 'package:chairil/data/database/location_box.dart';
import 'package:chairil/data/database/location_box_repository.dart';
import 'package:geolocator/geolocator.dart';

import '../util/core_function.dart';

class LocationUsecase {

  Future<LocationBox> getLocation() async {
    try {
      LocationPermission locationPermission = await Geolocator.checkPermission();
      if(locationPermission == LocationPermission.always || locationPermission == LocationPermission.whileInUse) {
        return await currentLocation();
      } else {
        await Geolocator.requestPermission();
        LocationPermission locationPermission = await Geolocator.checkPermission();
        CoreFunction.logPrint("Location Permission", locationPermission.toString());
        if (locationPermission == LocationPermission.always || locationPermission == LocationPermission.whileInUse) {
          return await currentLocation();
        } else {
          //? Save Location
          return LocationBox();
        }
      }   
    } catch (e) {
      CoreFunction.logPrint("Permission", e.toString());
      return LocationBox(latitude: 0, longitude: 0);
    }
  }

  Future<LocationBox> currentLocation() async {
    try {
      var currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high, 
        forceAndroidLocationManager: true, 
        timeLimit: const Duration(seconds: 10)) .catchError((e) async {
        CoreFunction.logPrint("TimeOut", "error boy");
        var pos = await Geolocator.getLastKnownPosition(forceAndroidLocationManager: true).timeout(const Duration(seconds: 5), onTimeout: () {
          CoreFunction.logPrint("TimeOutLagi", "error lagi boy");
          return Position(longitude: 0, latitude: 0, timestamp: DateTime.now(), accuracy: 0, altitude: 0, heading: 0, speed: 0, speedAccuracy: 0);
        });
        return pos!;
      });

      CoreFunction.logPrint( "Try location handphone", currentPosition.toString());
      LocationBoxRepository.save(LocationBox(latitude: currentPosition.latitude, longitude: currentPosition.longitude));
      return LocationBox(latitude: currentPosition.latitude, longitude: currentPosition.longitude);

    } catch (error) {
      CoreFunction.logPrint("Error Location", error.toString());
      LocationBoxRepository.save(LocationBox(latitude: 0, longitude: 0));
      return LocationBox(latitude: 0, longitude: 0);
    }
  }

}
