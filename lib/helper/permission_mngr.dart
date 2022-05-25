import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

 checkPermission()async{
  LocationPermission permission;
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }
}
locationPermissions(BuildContext context,Function function)async{
  bool allowed=false;
  await Permission.location.request();
  await Permission.locationAlways.request();
  allowed=await Permission.locationAlways.isGranted;

  if(allowed){
    return true;
  }
  else{
    return false;
  }
}

highAccuracyGPS(BuildContext context,Function function){

}
Future<Position> locateUser() async {
  Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  return position;
  //return Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
}

// getUserLocation() async {
//   currentLocation = await locateUser();
//   setState(() {
//     _center = LatLng(currentLocation.latitude, currentLocation.longitude);
//   });
//   print('center $_center');
// }

filePermissions(BuildContext context, Function function)async{
  bool allowed=false;
  await Permission.storage.request();
  allowed=await Permission.storage.isGranted;
  if(allowed){

    return true;
  }
  else{

    return false;
  }
}

galleryCameraPermission(BuildContext context,Function function)async{
  bool allowed=false;
  bool allowCamera=false;
  await Permission.photos.request();
  await Permission.camera.request();
  allowed=await Permission.photos.isGranted;
  allowCamera=await Permission.camera.isGranted;
  if(allowed&&allowCamera){
    return true;
  }
  else{
    return false;
  }
}