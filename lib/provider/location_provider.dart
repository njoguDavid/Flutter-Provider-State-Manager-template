import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:FlutterArchitecture/repository/location_updates.dart';

class LocationProvider with ChangeNotifier {
  final LocationUpdatesRepo locationUpdatesRepo;

  LocationProvider({@required this.locationUpdatesRepo});

  bool _locationPermissions=false;
  bool get locationPermissions =>_locationPermissions;

  Future<Position> _currentPosition;
  Future<Position> get currentPosition => _currentPosition;

  void getPermissionStatus() {
    _locationPermissions = locationUpdatesRepo.locationPermissions();
    notifyListeners();
  }

  void getLocationUpdates(){
    _currentPosition=locationUpdatesRepo.locateUser();

  }


}
