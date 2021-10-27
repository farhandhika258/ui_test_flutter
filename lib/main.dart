import 'package:flutter/material.dart';
import 'package:flutter_app_ui_test/select_topic_page.dart';
import 'package:flutter_app_ui_test/size_config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
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
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
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

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child: Container(
              width: SizeConfig.screenWidth,
              padding: EdgeInsets.only(
                  left: SizeConfig.tenPercentOfScreenWidth * 0.5,
                  right: SizeConfig.tenPercentOfScreenWidth * 0.5,
                  top: SizeConfig.tenPercentOfScreenHeight * 2.5
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                      'Swipe.',
                      style: TextStyle(
                          fontFamily: 'Merriweather',
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          color: Colors.white
                      )
                  ),

                  Text(
                    'Read.',
                    style: TextStyle(
                        fontFamily: 'Merriweather',
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                        color: Colors.white
                    ),
                  ),

                  Text(
                    'Learn.',
                    style: TextStyle(
                        fontFamily: 'Merriweather',
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                        color: Colors.white
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        top: SizeConfig.tenPercentOfScreenHeight * 2,
                    ),
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.tenPercentOfScreenHeight * 0.8,
                    child: RaisedButton(
                        color: Colors.white,
                        child: Text(
                          'Start Reading',
                          style: TextStyle(
                              color: Color(0xFF1C267C),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto',
                              fontSize: 20
                          ),
                        ),
                        onPressed: () {
                          _goToSelectTopic();
                        },
                        shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(3.0))
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 3,
                        bottom: SizeConfig.tenPercentOfScreenHeight
                    ),

                    width: SizeConfig.screenWidth,
                    child: Row(
                      children: [
                        Text(
                          'Already have an account? ',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 14,
                              color: Colors.white
                          ),
                        ),

                        Text(
                          'Log in',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.white
                          ),
                        ),
                      ],
                    )
                  )
                ],
              ),
            ),
          )
        )
    );
  }
   _goToSelectTopic() {
     Navigator.push(
       context,
       MaterialPageRoute(builder: (context) => SelectTopicPage()),
     );
   }
}