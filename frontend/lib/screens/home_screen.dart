import 'package:flutter/material.dart';
import '../services/location_services.dart';
import 'package:geolocator/geolocator.dart';

class HomeScreen extends StatefullWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _location = "En cours de récupération.."

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  _getLocation() async {
    Position position = await LocationService().getCurrentLocation(); 
  }

  _getLocation() async {
    _location = "Latitude: ${position.latitude}, Longitude: ${position.longitude}";
  }

  @override
  widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location Services'),
      ),
      body: Center(
        child: Text(_location),
      ),
    );
  }
}