import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/board_app_firestore/board_app.dart';
import 'package:first_app/ui/app.dart';
import 'package:first_app/weather_forecast_app/json_parsing/weather_forecast_data.dart';
import 'package:flutter/material.dart';


// void main() {
//  // final ThemeData appTheme = getTheme();
//   runApp(new MaterialApp(
//     home: TipCalculator(), //theme:appTheme,
//   ));
// }

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final ThemeData appTheme = getTheme();
    runApp(new MaterialApp(home: TipCalculator(),/*theme: appTheme,*/));
}

ThemeData getTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.red,
    backgroundColor: Colors.amber,
  primaryColor: Colors.green,textTheme:getTextTheme(base.textTheme));
}
TextTheme getTextTheme(TextTheme base)
{
  return base.copyWith(
    headline: base.headline1.copyWith(fontWeight: FontWeight.bold,color: Colors.blue),
    subtitle: base.subtitle1.copyWith(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.blueGrey),
    body1: base.body1.copyWith(fontWeight: FontWeight.bold,fontSize: 16.9,color: Colors.yellow,fontFamily:"Lobster"),
    button: base.button.copyWith(letterSpacing: 6)
  );
}


