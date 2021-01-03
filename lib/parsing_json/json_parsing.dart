import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class JsonParsingSimple extends StatefulWidget {
  @override
  _JsonParsingSimpleState createState() => _JsonParsingSimpleState();
}

class _JsonParsingSimpleState extends State<JsonParsingSimple> {
  Future data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = getData();
    data.then((value) => print(value[0]['title']));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                child: FutureBuilder(
      future: getData(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData)
          return createListView(snapshot.data, context);
        else
          return CircularProgressIndicator();
      },
    ))));
  }

  Future getData() {
    var data;
    Network network = Network("https://jsonplaceholder.typicode.com/posts");
    data = network.fetchData();
    return data;
  }

  Widget createListView(List snapshot, context) {
    return ListView.builder(itemBuilder: (context, int index) {
      return ListTile(
        leading: CircleAvatar(
          child: Text(snapshot[index]['id'].toString()),
        ),
        title: Text(snapshot[index]['title']),
        subtitle: Text(snapshot[index]['body']),
      );
    },itemCount: snapshot.length,);
  }
}

class Network {
  final String url;

  Network(this.url);

  Future fetchData() async {
    print("$url");
    Response response = await get(Uri.encodeFull(url));
    if (response.statusCode == 200) {
      //print(response.body);
      return json.decode(response.body);
    } else
      print(response.statusCode);
  }
}
