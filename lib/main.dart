import 'package:flutter/material.dart';
import 'package:mlao/providers/amount_cart_provider.dart';
import 'package:mlao/screens/home.dart';
import 'package:provider/provider.dart';
// import 'package:mlao/screens/home.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return AmountCartProvider();
          },
        )
      ],
      child: MaterialApp(
        title: 'MLAO',
        theme: ThemeData(
            primarySwatch: Colors.green,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        home: Home(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
