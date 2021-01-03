import 'package:first_app/board_app_firestore/ui/custom_card.dart';
import 'package:first_app/util/bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BoardApp extends StatefulWidget {
  @override
  _BoardAppState createState() => _BoardAppState();
}

class _BoardAppState extends State<BoardApp> {
  var fireStoreDb = FirebaseFirestore.instance.collection("board").snapshots();
  TextEditingController nameInputController;
  TextEditingController titleInputController;
  TextEditingController descriptionInputController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameInputController = TextEditingController();
    titleInputController = TextEditingController();
    descriptionInputController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(bottomNavigationBar: BottomBar(2),
      appBar: AppBar(
        title: Text("Board App (Social)"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(FontAwesomeIcons.pen),
        onPressed: () {
          _alertDialogue(context);
        },
      ),
      body: StreamBuilder(
        stream: fireStoreDb,
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, int index) {

                return CustomCard(snapshot:snapshot.data ,index:index);

                // return Padding(
                //   padding: const EdgeInsets.only(top: 18.0),
                //   child: Center(
                //       child:
                //           Text(snapshot.data.documents[index]['description'])),
                // );
              });
        },
      ),
    );
  }

  _alertDialogue(BuildContext context) async {
    await showDialog(
      context: context,
      child: AlertDialog(
        contentPadding: EdgeInsets.all(10),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("User Details"),
            Expanded(
                child: TextField(
              autocorrect: true,
              controller: nameInputController,
              autofocus: true,
              decoration: InputDecoration(
                labelText: "Name",
              ),
            )),
            Expanded(
                child: TextField(
              autocorrect: true,
              controller: titleInputController,
              autofocus: true,
              decoration: InputDecoration(
                labelText: "title",
              ),
            )),
            Expanded(
                child: TextField(
              autocorrect: true,
              controller: descriptionInputController,
              autofocus: true,
              decoration: InputDecoration(
                labelText: "description",
              ),
            ))
          ],
        ),
        actions: [
          FlatButton(
              onPressed: () {
                nameInputController.clear();
                descriptionInputController.clear();
                titleInputController.clear();
                Navigator.pop(context);
              },
              child: Text("cancel")),
          FlatButton(
              onPressed: () {
                FirebaseFirestore.instance
                    .collection("board")
                    .add({
                  'Name': nameInputController.text.isEmpty?" ":nameInputController.text,
                  'title': titleInputController.text.isEmpty?" ":titleInputController.text,
                  'description': descriptionInputController.text.isEmpty?" ":descriptionInputController.text,
                      'dateAdded': DateTime.now()
                    })
                    .then((value){ print(value.documentID);
                    nameInputController.clear();
                descriptionInputController.clear();
                titleInputController.clear();
                Navigator.pop(context);})
                    .catchError((error)=>print("Error"));

              },
              child: Text("Submit"))
        ],
      ),
    );
  }
}
