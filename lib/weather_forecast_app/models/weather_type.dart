import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Icon WeatherType(String weather,double imageSize)
{
  switch(weather)
  {
    case "clouds":
      return Icon(FontAwesomeIcons.cloud,color: Colors.pinkAccent,size: imageSize,);
      break;
    case "clear":
      return Icon(FontAwesomeIcons.solidSun,color: Colors.pinkAccent,size: imageSize,);
      break;
    case "clouds":
      return Icon(FontAwesomeIcons.cloudRain,color: Colors.pinkAccent,size: imageSize,);
      break;
    case "clouds":
      return Icon(FontAwesomeIcons.snowflake,color: Colors.pinkAccent,size: imageSize,);
      break;
    default :
      return Icon(FontAwesomeIcons.cloudRain,color: Colors.pinkAccent,size: imageSize,);
  }
}