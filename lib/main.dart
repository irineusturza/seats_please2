import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seats please!',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Seats please!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  TextEditingController frase = TextEditingController();
  
  void _incrementCounter() {
    setState(() {
      _counter++;
      frase.text = setPhrase();
    });
  }
  void _decrementCounter() {
    setState(() {
      _counter--;
      frase.text = setPhrase();
    });
  }

  String setPhrase() {
    String msg;
    if(_counter < 0){
      msg = "Yep, you are probably doing something wrong.";
    }else if(_counter >= 0 && _counter < 10){
      msg = "Continue, we still have seats available!";
    }else if(_counter == 10){
      msg = "That's it folks, last seat was taken!";
    }else if(_counter > 10){
      msg = "Better call your lawyer.\nYou just caused an overbooking.\nYou bastard!";
    }
    return msg;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     widget.title,
      //     style: TextStyle(
      //       color: Colors.grey,
      //     ),
      //     textAlign: TextAlign.center,
      //   ),
      //   backgroundColor: Colors.white,
      // ),
      body: Center(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.asset(
              "assets/back.jpg",
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'Passengers:',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        '$_counter',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        frase.text != "" ? frase.text : "Add or Remove Passangers",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
            backgroundColor: Colors.blueGrey,
          ),
          SizedBox(
            width: 5.0,
          ),
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
            backgroundColor: Colors.blueGrey,
          ),
        ],
      ), 
      
    );
  }
}
