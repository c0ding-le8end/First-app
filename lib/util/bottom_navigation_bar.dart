import 'package:first_app/board_app_firestore/board_app.dart';
import 'package:first_app/ui/app.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomBar extends StatelessWidget {
   int selectedIndex;
  BottomBar(this.selectedIndex);
  List<Widget> pages=[MoviesApp(),TipCalculator(),BoardApp()];


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.film),label: "Movies"),
        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.dollarSign),label: "TipCalc"),
        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.userFriends),label:"SocialBoard")
      ],onTap: (int index)
      {if(index!=selectedIndex)
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context){gi

          return pages[index];
        }));
      },showSelectedLabels: true,selectedItemColor: Colors.red,currentIndex:selectedIndex,
    );
  }
}
