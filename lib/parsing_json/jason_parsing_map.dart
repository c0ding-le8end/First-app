import 'dart:convert';

import 'package:first_app/model/posts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class JsonParingMap extends StatefulWidget {
  @override
  _JsonParingMapState createState() => _JsonParingMapState();
}

class _JsonParingMapState extends State<JsonParingMap> {
  Future<PostList> data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Network network = Network("https://jsonplaceholder.typicode.com/posts");
    data = network.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar:AppBar(title: Text("JSON PODO"),centerTitle: true,),body: FutureBuilder(
      future: data, builder: (context, AsyncSnapshot<PostList> snapshot) {
        List<Post> allPosts;
      if (snapshot.hasData) {
        allPosts=snapshot.data.posts;
        return creatListView(context, allPosts);
      } else
        return Center(child: CircularProgressIndicator());
    },),);
  }

  Widget creatListView(BuildContext context,List<Post> snapshot) {
    return ListView.builder(
        itemCount: snapshot.length, itemBuilder: (context, int index) {
      return ListTile(title: Text(snapshot[index].title),
        subtitle: Text(snapshot[index].body),
        leading: CircleAvatar(
          radius: 23, backgroundColor: Colors.yellow, child: Text(snapshot[index].id.toString()),),);
    });
  }
}

class Network {
  final String url;

  Network(this.url);

  Future<PostList> fetchData() async {
    print("$url");
    Response response = await get(Uri.encodeFull(url));
    if (response.statusCode == 200) {
      //print(response.body);
      return PostList.fromJson(json.decode(response.body));
    } else
      print(response.statusCode);
  }
}