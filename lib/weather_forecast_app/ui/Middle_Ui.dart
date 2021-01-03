import 'package:first_app/weather_forecast_app/json_parsing/weather_forecast_object.dart';
import 'package:first_app/weather_forecast_app/models/weather_type.dart';
import 'package:first_app/weather_forecast_app/util/url_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

Widget middleUi(BuildContext context, AsyncSnapshot<WeatherForecastObject> snapshot) {
  List weatherList=snapshot.data.list;
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "${snapshot.data.city.name} , ${snapshot.data.city.country}",
        style: TextStyle(
            color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      Text(dateCreator(weatherList[0].dt)),
      WeatherType(weatherList[0].weather[0].main.toString().toLowerCase(),195),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              (weatherList[0].main.tempMax - 273.15).toStringAsFixed(0) +
                  "°C",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              weatherList[0].weather[0].description
                  .toString()
                  .toUpperCase(),
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  weatherList[0].wind.speed.toString() + "mi/h",
                  style: TextStyle(fontSize: 18),
                ),Icon(FontAwesomeIcons.wind,color: Colors.brown,)
              ],
            ),
            SizedBox(width: 30,),
            Column(
              children: [
                Text(
                  weatherList[0].main.humidity.toString() + "%",
                  style: TextStyle(fontSize: 18),
                ),Icon(FontAwesomeIcons.smile,color: Colors.brown,)
              ],
            ),
            SizedBox(width: 30,),
            Column(
              children: [
                Text((weatherList[0].main.tempMax - 273.15).toStringAsFixed(0) +"°C" ,
                  style: TextStyle(fontSize: 18),
                ),Icon(FontAwesomeIcons.thermometer,color: Colors.brown,)
              ],
            ),
          ],
        ),
      )
    ],
  );
}
