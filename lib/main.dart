import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 170,
            decoration: new BoxDecoration(
                image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: new AssetImage('images/tea_bg.jpg',))),
          ),
          Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Container(
                    child: new Container(
                      padding: EdgeInsets.fromLTRB(0, 150, 0, 0),
                      child: new Card(
                        elevation: 8.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(18),
                            topRight: Radius.circular(18),
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                          ),
                        ),
                        margin: EdgeInsets.only(right: 0, left: 0),
                        child: new Wrap(
                          children: <Widget>[
                            Center(
                              child: Container(
                                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                                child: new Image.asset(
                                  'images/d_logo.jpg',
                                  height: 49,
                                  width: 179.39,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),

                            Center(
                              child: Container(
                                alignment: Alignment(0.0, 0.0),
                                padding: EdgeInsets.fromLTRB(30, 134, 30, 10),
                                child: Text(
                                  'Hay, Welcome!',
                                  style: TextStyle(
                                    fontFamily: 'Eina_regular',
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                alignment: Alignment(0.0, 0.0),
                                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                                child: Text(
                                  'Let make food and medicine',
                                  style: TextStyle(
                                    fontFamily: 'Eina_regular',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                alignment: Alignment(0.0, 0.0),
                                padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
                                child: Text(
                                  'ordering easier together!',
                                  style: TextStyle(
                                    fontFamily: 'Eina_regular',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),

                            Container(
                              child: Container(
                                //color: Colors.blueAccent,
                                width: double.infinity,

                                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                                height: 80,
                                child: RaisedButton(
                                  //padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                                  color: Colors.blue,
                                  onPressed: () {}, //
                                  child: new Text(
                                    "Create an account",
                                    style: TextStyle(
                                      fontFamily: 'Eina_regular',
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child:Align(

                                child: Container(


                                  //color: Colors.white,
                                    padding: EdgeInsets.fromLTRB(60, 40, 30, 10),

                                    child: new Row(children: <Widget>[
                                      Text(
                                        "Already have an account?",
                                        style: TextStyle(
                                          fontFamily: 'Eina_regular',
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                      Text(
                                        "Login",
                                        style: TextStyle(
                                          fontFamily: 'Eina_regular',
                                          fontSize: 17.0,
                                          color: Colors.blueAccent,
                                          fontWeight: FontWeight.w800,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ])),
                              ),

                            ),
                            Center(
                              child: Container(
                                //color: Colors.white,
                                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                                child: SizedBox(
                                  height: 70,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
