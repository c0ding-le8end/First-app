import 'package:first_app/model/movie.dart';
import 'package:first_app/model/questions.dart';
import 'package:first_app/util/bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:first_app/util/hexcolor.dart';

import 'movies_ui.dart';

class ScaffoldExample extends StatelessWidget {
  _doThis() {
    debugPrint("Alarm icon pressed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("hey buddies!"),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              icon: Icon(
                Icons.email,
              ),
              onPressed: () => debugPrint("email button pressed"),
            ),
            IconButton(
              icon: Icon(Icons.access_alarm_rounded),
              onPressed: _doThis,
            ),
            IconButton(icon: Icon(Icons.navigate_next), onPressed: () => null)
          ],
        ),
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box), label: "Accounts"),
            BottomNavigationBarItem(
                icon: Icon(Icons.house_outlined), label: "home")
          ],
          onTap: (int i,) =>
              debugPrint("$i pressed"),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.deepOrange,
            child: Icon(Icons.chat_bubble),
            onPressed: () => debugPrint("Trash")),
        body: Container(
          alignment: Alignment.center,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            /* InkWell(
              child: Text(
                "Hamdaan's First App!",
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 30,
                    color: Colors.black87),
              ),
              onTap: () => null,
            ),*/
            FirstButton()
          ]),
        ));
  }
}

class FirstButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          final bar = SnackBar(
            content: Text("Hamdaan's First App!"),
            backgroundColor: Colors.indigoAccent.shade700,
          );
          Scaffold.of(context).showSnackBar(bar);
        },
        child: Container(
            padding: EdgeInsets.all(40.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0), color: Colors.green),
            child: Text(
              "Button",
              style: TextStyle(
                fontSize: 30,
                fontStyle: FontStyle.italic,
              ),
            )));
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.black38,
        child: Center(
          child: Text("Hello World!",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.underline,
                  color: Colors.white)),
        ));
  }
}

class BizCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Biz Card",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black87,
        actions: [
          IconButton(
              icon: Icon(Icons.arrow_back_rounded), onPressed: () => null)
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.topLeft,
          children: [_card(), _pic()],
        ),
      ),
    );
  }

  Container _card() {
    return Container(
      width: 350,
      height: 200,
      margin: EdgeInsets.all(0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: AssetImage("images/order4.jpg"), fit: BoxFit.fill)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Hamdaan Ahmed Sawar",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 20,
                color: Colors.red.shade100),
          ),
          Text(
            "Froyo Industries",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.red.shade100),
          ),
          Text(
            "Just a Legend's BizCard!",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.red.shade100),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.android,
                color: Colors.red.shade100,
              ),
              Text("hamdaan.a.sawar@gmail.com",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      color: Colors.red.shade100))
            ],
          )
        ],
      ),
    );
  }

  Container _pic() {
    return Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          border: Border.all(color: Colors.transparent, width: 1.2),
          image: DecorationImage(
              image: AssetImage("images/me.jpg"), fit: BoxFit.fill),
        ));
  }
}

class Wisdom extends StatefulWidget {
  @override
  _WisdomState createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {
  int _index = 0;
  List quotes = [
    "“I'm selfish, impatient and a little insecure. I make mistakes, I am out of control and at times hard to handle. But if you can't handle me at my worst, then you sure as hell don't deserve me at my best.”",
    "Be yourself; everyone else is already taken.",
    "Two things are infinite: the universe and human stupidity; and I'm not sure about the universe.",
    "So many books, so little time.",
    "Be who you are and say what you feel, because those who mind don't matter, and those who matter don't mind.",
    "A room without books is like a body without a soul.",
    "You've gotta dance like there's nobody watching,Love like you'll never be hurt,Sing like there's nobody listening,And live like it's heaven on earth.",
    "You know you're in love when you can't fall asleep because reality is finally better than your dreams.",
    "You only live once, but if you do it right, once is enough.",
    "Be the change that you wish to see in the world.",
    "In three words I can sum up everything I've learned about life: it goes on."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        body: Container(
          alignment: Alignment.center,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                      width: 300,
                      height: 150,
                      margin: EdgeInsets.all(40),
                      child: Center(
                          child: Text(
                            quotes[_index % 11],
                            style: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.italic,
                                fontSize: 20),
                          ))),
                ),
                Divider(
                  thickness: 1.5,
                  color: Colors.amber.shade600,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 38.0),
                  child: FlatButton.icon(
                      onPressed: _increment,
                      color: Colors.deepOrange,
                      icon: Icon(
                        Icons.lightbulb,
                        color: Colors.yellow,
                      ),
                      label: Text(
                        "Enlighten me!",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                Spacer()
              ],
            ),
          ),
        ));
  }

  _increment() {
    setState(() {
      _index++;
    });
  }
}

class TipCalculator extends StatefulWidget {
  @override
  _BuildState createState() => _BuildState();
}

class _BuildState extends State<TipCalculator> {
  double _billAmount = 0.0;
  int _tipPercentage = 0;
  int _personCounter = 1;
  Color _purple = HexColor("#800080");

  @override
  Widget build(BuildContext context) {
    return Scaffold(bottomNavigationBar: BottomBar(1),
        body: Container(
          margin: EdgeInsets.only(top: MediaQuery
              .of(context)
              .size
              .height * 0.1),
          alignment: Alignment.center,
          color: Colors.white,
          child: ListView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.all(20.5),
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: _purple.withOpacity(0.1)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Total Per Person",
                      style: TextStyle(
                          color: _purple.withOpacity(0.9),
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    Text(
                        "Rs.${((_billAmount +
                            _tipPercentage / 100 * _billAmount) /
                            _personCounter).toStringAsFixed(2)}",
                        style: TextStyle(
                            color: _purple.withOpacity(0.8),
                            fontSize: 20,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 12),
                  padding: EdgeInsets.all(23),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: Colors.blueGrey.shade300,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      TextField(
                          keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                          style: TextStyle(color: _purple.withOpacity(1)),
                          decoration: InputDecoration(
                            prefix: Text("Bill amount"),
                            prefixIcon: Icon(Icons.attach_money),
                          ),
                          onChanged: (String value) {
                            try {
                              _billAmount = double.parse(value);
                            } catch (exception) {
                              _billAmount = 0;
                            }
                          }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Split"),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if (_personCounter > 1) {
                                      _personCounter--;
                                    }
                                  });
                                },
                                child: Container(
                                    width: 40.0,
                                    height: 40.0,
                                    margin: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                        color: _purple.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(
                                            12)),
                                    child: Center(
                                      child: Text(
                                        "-",
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: _purple.withOpacity(0.8),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )),
                              ),
                              Text(
                                "$_personCounter",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: _purple.withOpacity(0.9),
                                    fontSize: 19),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _personCounter++;
                                  });
                                },
                                child: Container(
                                    width: 40.0,
                                    height: 40.0,
                                    margin: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                        color: _purple.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(
                                            12)),
                                    child: Center(
                                      child: Text(
                                        "+",
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: _purple.withOpacity(0.8),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )),
                              )
                            ],
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Tip"),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Text(
                              "Rs.${_tipPercentage / 100 * _billAmount}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: _purple.withOpacity(0.9),
                                  fontSize: 20),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "$_tipPercentage%",
                            style: TextStyle(
                                color: _purple.withOpacity(0.9),
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                          Slider(
                            min: 0,
                            max: 100,
                            divisions: 10,
                            activeColor: _purple.withOpacity(0.8),
                            value: _tipPercentage.toDouble(),
                            onChanged: (double value) {
                              setState(() {
                                _tipPercentage = value.round();
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ));
  }
}

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  final truthSnack = SnackBar(
    content: Center(
        child: Icon(
          Icons.check,
          color: Colors.white,
          size: 300,
        )),
    duration: Duration(milliseconds: 200),
    backgroundColor: Colors.lightGreenAccent,
  );
  final falseSnack = SnackBar(
    content: Center(
        child: Icon(
          Icons.close,
          color: Colors.white,
          size: 300,
        )),
    duration: Duration(milliseconds: 200),
    backgroundColor: Colors.red,
  );
  int _index = 0,
      _truthIndex = 0,
      _correct = 0;
  List _questions = [
    QuestionBank.name(
        "Cyclones spin in a clockwise direction in the southern hemisphere",
        true),
    QuestionBank.name("Goldfish only have a memory of three seconds", false),
    QuestionBank.name("The capital of Libya is Benghazi", false),
    QuestionBank.name("Dolly Parton is the godmother of Miley Cyrus", true),
    QuestionBank.name(
        "Roger Federer has won the most Wimbledon titles of any player", false),
    QuestionBank.name("An octopus has five hearts", false),
    QuestionBank.name(
        "Brazil is the only country in the Americas to have the official language of Portuguese",
        true),
    QuestionBank.name(
        "The Channel Tunnel is the longest rail tunnel in the world", false),
    QuestionBank.name(
        "Darth Vader famously says the line \“Luke, I am your father\” in The Empire Strikes Back",
        false),
    QuestionBank.name(
        "Olivia Newton-John represented the UK in the Eurovision Song Contest in 1974, the year ABBA won with \“Waterloo\”",
        true)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quiz App",
          /*style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.green.shade800),*/
        ),
        centerTitle: true,
        //backgroundColor: Colors.blueGrey,
      ),
      //backgroundColor: Colors.blueGrey,
      body: Builder(
        builder: (BuildContext context) =>
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      "images/flag.png",
                      width: 200,
                      height: 300,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                                child: Text(
                                  "$_index" +
                                      " ${-1 % 10}" +
                                      _questions[_index % _questions.length]
                                          .question,
                                  //style: TextStyle(color: Colors.grey.shade50),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RaisedButton(
                            onPressed: _previousQuestion,
                            color: Colors.green.shade700,
                            child: Icon(Icons.arrow_back)),
                        RaisedButton(
                          onPressed: () {
                            _truthIndex = _checkAnswer(true);
                            if (_truthIndex == 10) {
                              Scaffold.of(context).showSnackBar(truthSnack);
                            } else {
                              Scaffold.of(context).showSnackBar(falseSnack);
                            }
                            setState(() {
                              _index++;
                            });
                          },
                          color: Colors.green.shade700,
                          child: Text(
                            "True",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        RaisedButton(
                          onPressed: () {
                            _truthIndex = _checkAnswer(false);
                            if (_truthIndex == 10) {
                              Scaffold.of(context).showSnackBar(truthSnack);
                            } else {
                              Scaffold.of(context).showSnackBar(falseSnack);
                            }
                            setState(() {
                              _index++;
                            });
                          },
                          color: Colors.green.shade700,
                          child: Text(
                            "False",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        RaisedButton(
                            onPressed: _nextQuestion,
                            color: Colors.green.shade700,
                            child: Icon(Icons.arrow_forward))
                      ]),
                  Spacer(),
                ],
              ),
            ),
      ),
    );
  }

  int _checkAnswer(bool answer) {
    if (answer == _questions[_index % _questions.length].isCorrect) {
      _correct++;
      return 10;
    } else {
      return 20;
    }
  }

  void _nextQuestion() {
    setState(() {
      _index++;
    });
  }

  void _previousQuestion() {
    setState(() {
      _index--;
    });
  }
}

class MoviesApp extends StatefulWidget {
  @override
  _MoviesAppState createState() => _MoviesAppState();
}

class _MoviesAppState extends State<MoviesApp> {
  List<Movie> movies = Movie.movieList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(bottomNavigationBar: BottomBar(0),
      appBar: AppBar(
        title: Text(
          "Movies App!(Dummy)",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      backgroundColor: Colors.blueGrey,
      body: ListView.builder(
        itemBuilder: (BuildContext context, int _index) {
          return Stack(children: [
            cardBuilder(context, movies[_index]),
            Positioned(top: 8, child: movieImage(movies[_index].images[0]))
          ]);
        }
        /*
          return Card(
            color: Colors.white,
            child: ListTile(
              title: Text("${movies[_index].title}"),
              leading: CircleAvatar(
                backgroundColor: Colors.purple,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                          image: NetworkImage(movies[_index].images[0]),fit: BoxFit.cover)),

                ),
              ),
              subtitle: Text("Subtitle Sample"),
              trailing: Text("....Sample ;)"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Name(
                              chosenMovie: movies[_index],
                            )));
              },
              /*onTap: ()=>debugPrint("HAlleuah+${movies[_index]}")*/
            ),
            elevation: 60.0,
          );
        }*/
        ,
        itemCount: movies.length,
      ),
    );
  }

  Widget cardBuilder(BuildContext context, Movie movie) {
    return InkWell(
        child: Container(
          margin: EdgeInsets.only(left: 90),
          height: 150,
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: Card(
              color: Colors.black,
              child: Padding(
                padding:
                const EdgeInsets.only(top: 12.0, bottom: 8.0, left: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          movie.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        Text(
                          "${movie.imdbRating}/10",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Released:${movie.released}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        Text(
                          movie.runtime,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        Text(movie.rated,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white))
                      ],
                    )
                  ],
                ),
              )),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      Name(
                        chosenMovie: movie,
                      )));
        });
  }

  Widget movieImage(String imgUrl) {
    return Container(
      width: 100,
      height: 150,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(imgUrl ??
                  'https://static01.nyt.com/images/2016/09/28/us/17xp-pepethefrog_web1/28xp-pepefrog-articleLarge.jpg?quality=75&auto=webp&disable=upscale'),
              fit: BoxFit.cover)),
    );
  }
}

class Name extends StatelessWidget {
  final Movie chosenMovie;

  const Name({Key key, this.chosenMovie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chosenMovie.title),
      ),
      body: ListView(
        children: [
          MovieThumbnailDetails(thumbnail: chosenMovie.images[0]),
          MoviePosterDetails(chosenPoster: chosenMovie),
          DividerContainer(),
          ExtraMovieDetails(
            movie: chosenMovie,
          ),DividerContainer(),
          ImageList(imageList: chosenMovie.images,)


        ],
      ),
      /*  body: Center(
        child: RaisedButton(
            child: Text(
              "Return ${this.chosenMovie.title}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),*/
    );
  }
}

