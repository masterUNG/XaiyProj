import 'package:flutter/material.dart';
import 'package:mlao/screens/home.dart';
// import 'package:mlao/screens/home.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MLAO',
      theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
