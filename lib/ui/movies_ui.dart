import 'package:first_app/model/movie.dart';
import 'package:flutter/material.dart';

class MoviePosterDetails extends StatelessWidget {
  final Movie chosenPoster;

  const MoviePosterDetails({Key key, this.chosenPoster}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Poster(givenPoster: chosenPoster.images[1]),
        SizedBox(
          width: 16.0,
        ),
        Expanded(child: Details(movie: chosenPoster))
      ],
    );
  }
}

class Details extends StatelessWidget {
  final Movie movie;

  const Details({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${movie.released} .   ${movie.rated} .   ${movie.runtime}"
              .toUpperCase(),
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w600, color: Colors.cyan),
        ),
        SizedBox(
          height: 8.0,
        ),
        Text("${movie.imdbRating} /10",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.cyan)),
        Text(
          "${movie.title}",
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent),
        ),
        Text.rich(TextSpan(style: TextStyle(fontSize: 13), children: [
          TextSpan(text: "${movie.plot}"),
          TextSpan(text: "more...", style: TextStyle(color: Colors.blueAccent))
        ]))
      ],
    );
  }
}

class Poster extends StatelessWidget {
  final String givenPoster;

  const Poster({Key key, this.givenPoster}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.all(Radius.circular(16.0));
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ClipRRect(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(givenPoster), fit: BoxFit.cover),
              ),
              height: 190,
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 4,
            ),
            borderRadius: borderRadius),
      ),
    );
  }
}

class MovieThumbnailDetails extends StatelessWidget {
  final String thumbnail;

  const MovieThumbnailDetails({Key key, this.thumbnail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: 190,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(thumbnail), fit: BoxFit.cover)),
                child: Center(
                  child: Icon(
                    Icons.play_circle_outline,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0x00f2f2f2), Color(0xfff2f2f2)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            height: 80,
          )
        ],
      ),
      onTap: () => debugPrint("Yolo"),
    );
  }
}

class ExtraMovieDetails extends StatelessWidget {
  final Movie movie;

  const ExtraMovieDetails({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Info(field: "genre:", value: movie.genre),
        Info(field: "director:", value: movie.director),
        Info(field: "actors:", value: movie.actors),
        Info(field: "writer:", value: movie.writer),
        Info(field: "awards:", value: movie.awards),
        Info(field: "country:", value: movie.country)
      ],
    );
  }
}

class Info extends StatelessWidget {
  final String field;
  final String value;

  const Info({Key key, this.field, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "$field",
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.blue.shade900,
                    fontWeight: FontWeight.bold),
              ),
              Expanded(
                  child: Text("$value",
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.indigo.shade900,
                          fontWeight: FontWeight.bold)))
            ],
          ),
          SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}

class ImageList extends StatelessWidget {
  final List<String> imageList;

  const ImageList({Key key, this.imageList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(height: 200,
      child: ListView.separated(scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) =>
              SizedBox(
                width: 8,
              ),
          itemCount: imageList.length,
          itemBuilder: (context, index)=>ClipRRect(borderRadius: BorderRadius.all(Radius.circular(40)),
              child: Container(height: 160,
                width: MediaQuery.of(context).size.width/4,
                decoration: BoxDecoration(image: DecorationImage(
                    image: NetworkImage(imageList[index]),fit: BoxFit.cover)),))
      ),
    );
  }
}
class DividerContainer extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(color:Colors.blueGrey,width: MediaQuery.of(context).size.width,height: 0.5,),
    );  }

}
