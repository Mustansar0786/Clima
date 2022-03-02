import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    getLocation();
    super.initState();
  }

  double latitude = 0;
  double longitude = 0;
  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = (location.latitude);
    longitude = (location.longitude);
  }

  void getData() async {
    http.Response response = await http.get(Uri.parse(
        'api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=b4cc109476d939bf689be6c35ac3be68'));
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return const Scaffold();
  }
}
