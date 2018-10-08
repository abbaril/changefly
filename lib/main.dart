import 'package:flutter/material.dart';
import 'image_loader.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _AppState createState() => new _AppState();
}

class _AppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("changefly"),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //ImageLoader class the heart of the app
            ImageLoader(),

            //Name-logo that will appear at the bottom
            Image.asset(
              'images/changeflyname.png',
              width: 100.0,
              height: 100.0,
              alignment: Alignment.center,
            )
          ],
        )),
      ),
    );
  }
}
