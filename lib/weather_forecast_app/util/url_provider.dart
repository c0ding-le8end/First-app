import 'package:intl/intl.dart';

String Station(String city)
{
   return "http://api.openweathermap.org/data/2.5/forecast?q=${city}&appid=94efe6454e663f73a7572c8628c4d037";
}
String dateCreator(int weirdDate)
{
return DateFormat.yMMMMEEEEd().format(
    DateTime.fromMillisecondsSinceEpoch(weirdDate * 1000));

}