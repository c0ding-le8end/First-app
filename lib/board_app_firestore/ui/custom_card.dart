import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class CustomCard extends StatelessWidget {
  final QuerySnapshot snapshot;
  final int index;

  const CustomCard({Key key, this.snapshot, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var snapshotData = snapshot.documents[index];
    var docId = snapshotData.documentID;
    TextEditingController nameInputController = TextEditingController(text: "${snapshotData['Name']}");
    TextEditingController titleInputController = TextEditingController(text: "${snapshotData['title']}");
    TextEditingController descriptionInputController = TextEditingController(text: "${snapshotData['description']}");
    var dateTime = DateTime.fromMillisecondsSinceEpoch(
        snapshotData['dateAdded'].seconds * 1000);
    var formattedDate = DateFormat.yMMMMEEEEd().format(dateTime);
    return Column(
      children: [
        Container(
          height: 190,
          child: Card(
            elevation: 9,
            child: Column(children: [
              ListTile(
                leading: CircleAvatar(
                  radius: 34,
                  child: Text(snapshotData['title'].toString()[0]),
                ),
                title: Text(snapshotData['title'].toString()),
                subtitle: Text(snapshotData['description']),
                contentPadding: EdgeInsets.symmetric(horizontal: 1),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "By ${snapshotData['Name']} ",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text("$formattedDate")
                  ],
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(FontAwesomeIcons.trashAlt),
                    onPressed: () async {
                      await FirebaseFirestore.instance
                          .collection("board")
                          .doc(docId)
                          .delete();
                    },
                    iconSize: 14,
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(FontAwesomeIcons.edit),
                        onPressed: () {
                          _alertDialouge(context, nameInputController,
                              descriptionInputController, titleInputController,docId);
                        },
                        iconSize: 14,
                      )
                    ],
                  )
                ],
              ),
            ]),
          ),
        )
      ],
    );
  }

  _alertDialouge(
      BuildContext context,
      TextEditingController nameInputController,
      TextEditingController descriptionInputController,
      TextEditingController titleInputController,var docId) async {
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
                  labelText: "description"
                ),
              ))
            ],
          ),actions: [
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
                    .collection("board").doc(docId)
                    .update({
                  'Name': nameInputController.text.isEmpty?" ":nameInputController.text,
                  'title': titleInputController.text.isEmpty?" ":titleInputController.text,
                  'description': descriptionInputController.text.isEmpty?" ":descriptionInputController.text,
                  'dateAdded': DateTime.now()
                })
                    .then((value){
                nameInputController.clear();
                descriptionInputController.clear();
                titleInputController.clear();
                Navigator.pop(context);})
                    .catchError((error)=>print("Error"));

              },
              child: Text("Submit"))
        ],
        ));
  }
}
