import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/city_background.png"), fit: BoxFit.cover),
      ),
      child: Column(
        children: const [
          Align(
            alignment: Alignment.topLeft,
            child: TextButton(
              onPressed: null,
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
          ),
          Card(
            child: ListTile(
              //
              title: TextField(
                decoration: InputDecoration(
                    fillColor: Colors.white, hintText: "Enter City Name"),
              ),
            ),
          ),
          TextButton(
            onPressed: null,
            child: Text(
              "Get Weather",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 24),
            ),
          )
        ],
      ),
    );
  }
}
