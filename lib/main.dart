import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maze Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Maze Game'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String backgroundImageURL = "assets/images/start.jpg";

  bool _isStartVisible = true;
  bool _isScoreMenuVisible = false;

  bool _isUpVisible = false;
  bool _isDownVisible = false;
  bool _isLeftVisible = false;
  bool _isRightVisible = false;

  int currentLocationNumber = 0;
  int currentLocationIndex = 0;

  int score = 0;
  String display = "";

  List<int> maze = [10, 8, 10, 9,
                   28, 1, 0, 12,
                   12, 10, 9, 13,
                   6, 5, 6, 5];

  void _checkDoors(){
    setState(() {

      var number = currentLocationNumber;

      if(number >= 16){
        number = number - 16;
        _isUpVisible = true;
        _isDownVisible = true;
        _isLeftVisible = false;
        _isRightVisible = false;
        backgroundImageURL = "assets/images/goradol.jpg";

      }

      if(number == 15 ) {
        //15 - dol/gora/lewo/prawo
        _isUpVisible = true;
        _isDownVisible = true;
        _isLeftVisible = true;
        _isRightVisible = true;
        backgroundImageURL = "assets/images/wszystkie.jpg";

      }

      if(number == 14 ) {
        //14 - dol/gora/prawo
        _isUpVisible = true;
        _isDownVisible = true;
        _isLeftVisible = false;
        _isRightVisible = true;
        backgroundImageURL = "assets/images/goraprawodol.jpg";
      }

      if(number == 13 ) {
        //13 - dol/gora/lewo
        _isUpVisible = true;
        _isDownVisible = true;
        _isLeftVisible = true;
        _isRightVisible = false;
        backgroundImageURL = "assets/images/dollewogora.jpg";

      }

      if(number == 12 ) {
        //12 - dol/gora
        _isUpVisible = true;
        _isDownVisible = true;
        _isLeftVisible = false;
        _isRightVisible = false;
        backgroundImageURL = "assets/images/goradol.jpg";

      }

      if(number == 11 ) {
        //11 - dol/lewo/prawo
        _isUpVisible = false;
        _isDownVisible = true;
        _isLeftVisible = true;
        _isRightVisible = true;
        backgroundImageURL = "assets/images/prawodollewo.jpg";

      }

      if(number == 10 ) {
        //10 - dol/prawo
        _isUpVisible = false;
        _isDownVisible = true;
        _isLeftVisible = false;
        _isRightVisible = true;
        backgroundImageURL = "assets/images/prawodol.jpg";

      }

      if(number == 9 ) {
        //9 - dol/lewo
        _isUpVisible = false;
        _isDownVisible = true;
        _isLeftVisible = true;
        _isRightVisible = false;
        backgroundImageURL = "assets/images/dollewo.jpg";

      }

      if(number == 8 ) {
        //8 - dol
        _isUpVisible = false;
        _isDownVisible = true;
        _isLeftVisible = false;
        _isRightVisible = false;
        backgroundImageURL = "assets/images/dol.jpg";

      }

      if(number == 7 ) {
        //7 - gora/lewo/prawo
        _isUpVisible = true;
        _isDownVisible = false;
        _isLeftVisible = true;
        _isRightVisible = true;
        backgroundImageURL = "assets/images/lewogoraprawo.jpg";

      }

      if(number == 6 ) {
        //6 - gora/prawo
        _isUpVisible = true;
        _isDownVisible = false;
        _isLeftVisible = false;
        _isRightVisible = true;
        backgroundImageURL = "assets/images/goraprawo.jpg";

      }

      if(number == 5 ) {
        //5 - gora/lewo
        _isUpVisible = true;
        _isDownVisible = false;
        _isLeftVisible = true;
        _isRightVisible = false;
        backgroundImageURL = "assets/images/lewogora.jpg";

      }

      if(number == 4 ) {
        //4 - gora
        _isUpVisible = true;
        _isDownVisible = false;
        _isLeftVisible = false;
        _isRightVisible = false;
        backgroundImageURL = "assets/images/gora.jpg";

      }

      if(number == 3 ) {
        //3 - lewo/prawo
        _isUpVisible = false;
        _isDownVisible = false;
        _isLeftVisible = true;
        _isRightVisible = true;
        backgroundImageURL = "assets/images/lewoprawo.jpg";

      }

      if(number == 2 ) {
        //2 - prawo
        _isUpVisible = false;
        _isDownVisible = false;
        _isLeftVisible = false;
        _isRightVisible = true;
        backgroundImageURL = "assets/images/prawo.jpg";

      }

      if(number == 1 ) {
        //1 - lewo
        _isUpVisible = false;
        _isDownVisible = false;
        _isLeftVisible = true;
        _isRightVisible = false;
        backgroundImageURL = "assets/images/lewo.jpg";

      }

      if(number == 0 ) {
        // win
        _isUpVisible = false;
        _isDownVisible = false;
        _isLeftVisible = false;
        _isRightVisible = false;

        if(score == 12) {
          backgroundImageURL = "assets/images/wygranawysoka.jpg";
        } else if(score > 12 && score <= 20){
          backgroundImageURL = "assets/images/wygranasrednia.jpg";
        } else{
          backgroundImageURL = "assets/images/wygranaslaba.jpg";
        }

        _isScoreMenuVisible = true;
        display = ("  Trafiles za $score razem");

      }

    });
  }

  void _pressUp(){
    setState(() {
      currentLocationIndex -= 4;
      currentLocationNumber = maze[currentLocationIndex];
      score += 1;
      _checkDoors();
    });
  }

  void _pressDown(){
    setState(() {
      currentLocationIndex += 4;
      currentLocationNumber = maze[currentLocationIndex];
      score += 1;
      _checkDoors();
    });
  }

  void _pressLeft() {
    setState(() {
      currentLocationIndex -= 1;
      currentLocationNumber = maze[currentLocationIndex];
      score += 1;
      _checkDoors();
    });
  }

  void _pressRight() {
    setState(() {
      currentLocationIndex += 1;
      currentLocationNumber = maze[currentLocationIndex];
      score += 1;
      _checkDoors();
    });
  }

  void _findStartingLocation(){
    setState(() {
      for(var i=0; i < maze.length; i++){
        if (maze[i] > currentLocationNumber) {
          currentLocationNumber = maze[i];
          currentLocationIndex = i;
        }
      }
      _checkDoors();
      score = 0;
      _isStartVisible = false;
      _isScoreMenuVisible = false;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(backgroundImageURL),
              fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            Positioned(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                Visibility(
                    visible: _isUpVisible,
                    child: ElevatedButton(
                      child: const Text("Góra"),
                      onPressed:_pressUp,
                    )),
                Row(
                  children: <Widget>[
                    Visibility(
                        visible: _isLeftVisible,
                        child: ElevatedButton(
                          child: const Text("Lewo"),
                          onPressed:_pressLeft,
                        )),
                    Expanded(child: Container()),
                    Visibility(
                        visible: _isStartVisible,
                        child: ElevatedButton(
                          child: const Text("START"),
                          onPressed: _findStartingLocation,
                        )),
                    Expanded(child: Container()),
                    Visibility(
                        visible: _isRightVisible,
                        child: ElevatedButton(
                          child: const Text("Prawo"),
                          onPressed: _pressRight,
                        )),
                  ],
                ),
                Visibility(
                    visible: _isDownVisible,
                    child: ElevatedButton(
                      child: const Text("Dół"),
                      onPressed: _pressDown,
                    )),
              ],
            ),
            ),

            Positioned(
                top: 150,
                child: Container(
                  width: 470,
                  child: Visibility(
                    visible: _isScoreMenuVisible,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                         ElevatedButton(
                          child: const Text("RESET"),
                          onPressed: _findStartingLocation,
                        ),
                        Container(
                          child: Text(
                              display,
                              style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
