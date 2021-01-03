import 'package:first_app/weather_forecast_app/json_parsing/weather_forecast_data.dart';
import 'package:first_app/weather_forecast_app/json_parsing/weather_forecast_object.dart';
import 'package:first_app/weather_forecast_app/models/weather_Card.dart';
import 'package:first_app/weather_forecast_app/models/weather_type.dart';
import 'package:first_app/weather_forecast_app/util/url_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

Widget bottomUi(
    BuildContext context, AsyncSnapshot<WeatherForecastObject> snapshot) {
  //  var weatherListOriginal = snapshot.data.list;
  //  List weatherList =List();
  // int j=0;
  //  for(int i=0;i<40;i++)
  //    {
  //      if(i%5==0)
  //        {
  //
  //          weatherList[j]=weatherListOriginal[i].dt;
  //        j++;
  //        }
  //
  //    }
  var weatherListOriginal = snapshot.data.list;
  List weatherList = List(6);
  weatherList[0] = weatherListOriginal[0];
  weatherList[1] = weatherListOriginal[4];
  weatherList[2] = weatherListOriginal[12];
  weatherList[3] = weatherListOriginal[20];
  weatherList[4] = weatherListOriginal[28];
  weatherList[5] = weatherListOriginal[36];

  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical:16.0,),
        child: Center(child:Text("7-DAY FORECAST",style: TextStyle(fontSize: 19),)),
      ),

      Container(
          height: 180,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>WeatherForecastData(cityName: snapshot.data.city.toString(),))),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: Container(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Center(
                                child: Text(
                                  weatherCard(context, weatherList, index).toString(),
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Stack(children: [
                                  Container(
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(50))),
                                  ),
                                  WeatherType(
                                      weatherList[index]
                                          .weather[0]
                                          .main
                                          .toString()
                                          .toLowerCase(),
                                      50)
                                ]),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Column(children: [
                                    Row(
                                      children: [
                                        Text((weatherList[index].main.tempMin - 273.15)
                                                .toStringAsFixed(0) +
                                            "°C"),Icon(
                                        FontAwesomeIcons.arrowAltCircleDown,color: Colors.grey,)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text((weatherList[index].main.tempMax - 273.15)
                                            .toStringAsFixed(0) +
                                            "°C"),Icon(
                                          FontAwesomeIcons.arrowAltCircleUp,color: Colors.grey,)
                                      ],
                                    ),
                                    Text("Hum: ${weatherList[index].main.humidity}%"),
                                    Text("Win: ${weatherList[index].main.humidity}mi/h")

                                  ]),
                                )
                              ],
                            )
                          ]),
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: 180,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.purple.shade300, Colors.white])),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, int index) {
                return SizedBox(
                  width: 10,
                );
              },
              itemCount: 6)),
    ],
  );
}
