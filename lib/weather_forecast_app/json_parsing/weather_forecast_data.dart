import 'dart:convert';
import 'dart:math';

import 'package:first_app/weather_forecast_app/json_parsing/weather_forecast_object.dart';
import 'package:first_app/weather_forecast_app/ui/Middle_Ui.dart';
import 'package:first_app/weather_forecast_app/ui/bottom_ui.dart';
import 'package:first_app/weather_forecast_app/util/url_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class WeatherForecastData extends StatefulWidget {
  String cityName;
  WeatherForecastData({this.cityName="mumbai"});
  @override
  _WeatherForecastDataState createState() => _WeatherForecastDataState();
}

class _WeatherForecastDataState extends State<WeatherForecastData> {
  Future<WeatherForecastObject> data;
String _cityName=WeatherForecastData().cityName;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = getDataFromUrl(_cityName);
    data.then((value) => print("${data}"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: data,
      builder: (BuildContext context,
          AsyncSnapshot<WeatherForecastObject> snapshot) {
        if (snapshot.hasData) {
          return ListView(
            children: [
              Head(snapshot),
              middleUi(context,snapshot),
              bottomUi(context, snapshot)
            ],
          );
          // return Center(child: Text("Hello"));
        } else
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
      },
    ));
  }

  Column Head(AsyncSnapshot<WeatherForecastObject> snapshot) {
    var cities;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
              keyboardType: TextInputType.text,
              onSubmitted: (value) {
                _cityName = value;

                setState(() {
                  data = getDataFromUrl(_cityName);
                });
              },
              decoration: InputDecoration(
                  hintText: "Enter city",
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      gapPadding: 4.0))),
        ),
        // SearchableDropdown(items:searchCities(), onChanged: null,keyboardType: TextInputType.text,),
        SizedBox(
          height: 15,
        ),

      ],
    );
  }

  Future<WeatherForecastObject> getDataFromUrl(String city) {
    return Network(Station(city)).fetchData();
  }
// List<DropdownMenuItem<ListTile>> searchCities()
// {
//   final List<String> cities=["mumbai","New York","London"];
//   return cities.map((e) => DropdownMenuItem(child: ListTile(title: Text(e),),value:e));
// }
}

class Network {
  final String url;

  Network(this.url);

  Future<WeatherForecastObject> fetchData() async {
    Response response = await get(Uri.encodeFull(url));
    if (response.statusCode == 200)
      return WeatherForecastObject.fromJson(json.decode(response.body));
    else
      throw Exception("Error recieving data");
  }
}
