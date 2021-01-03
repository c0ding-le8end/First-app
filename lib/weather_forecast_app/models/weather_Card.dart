import 'package:first_app/weather_forecast_app/json_parsing/weather_forecast_object.dart';
import 'package:first_app/weather_forecast_app/util/url_provider.dart';
import 'package:flutter/cupertino.dart';

String weatherCard(BuildContext context,List weatherList,int index)
{

    var date = dateCreator(weatherList[index].dt);
    String day = date.split(",")[0];
    return day;

}

