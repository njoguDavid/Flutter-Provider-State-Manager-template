import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationUpdatesRepo{
LocationUpdatesRepo();

  locationPermissions()async{
    bool allowed=false;
    await Permission.locationAlways.request();
    allowed=await Permission.locationAlways.isGranted;

    if(allowed){
      return true;
    }
    else{
      return false;
    }
  }

  Future<Position> locateUser() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return position;
    //return Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

}