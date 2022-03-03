import 'package:clima/screens/city_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key, required this.locationWeather})
      : super(key: key);

  final locationWeather;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  var weather = WeatherModel();
  late int temprature;
  late String cityName;
  late String weatherIcon;
  late String weatherMessage;
  @override
  void initState() {
    updateUi(widget.locationWeather);
    super.initState();
  }

  void updateUi(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temprature = 0;
        weatherIcon = "Error";
        weatherMessage = "Unable to get Weather";
        cityName = "";
        return;
      }
      double temp = weatherData['main']['temp'];
      temprature = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      cityName = weatherData['name'];
      weatherMessage = weather.getMessage(temprature);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("images/location.PNG"),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () async {
                          var weatherData =
                              await WeatherModel().getLocationWeather();
                          updateUi(weatherData);
                        },
                        child: const Icon(
                          Icons.near_me,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          var typedName = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CityScreen()));
                          {
                            // ignore: unnecessary_null_comparison
                            if (typedName != null) {
                              var weatherData = await weather
                                  .getCityWeather(typedName.toString());
                              updateUi(weatherData);
                            }
                          }
                          // print(cityName.toString());
                        },
                        child: const Icon(
                          Icons.location_city,
                          color: Colors.white,
                          size: 50,
                        ),
                      )
                    ]),
                Text("$cityName ",
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                    )),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Text("$temprature  ̊ C ",
                          style: GoogleFonts.spartan(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.bold),
                          )),
                      Text(
                        weatherIcon,
                        style: const TextStyle(
                            fontSize: 50, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      "$weatherMessage in $cityName",
                      // "Today is a sunny day in $cityName . use an umbera ",
                      style: GoogleFonts.spartan(
                        textStyle: kMessageTextStyle.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 50),
                      ),
                      //const TextStyle(
                      //   color: Colors.white,
                      //   fontWeight: FontWeight.bold,
                      //   fontSize: 50,
                      // ),
                      textAlign: TextAlign.right,
                    ))
              ]),
        ),
      ),
    );
  }
}
