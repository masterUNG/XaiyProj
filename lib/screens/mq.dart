import 'package:flutter/material.dart';

// class MQuery {
//   static double width;
//   static double height;
//   void init(BuildContext context) {
//     final MediaQuery _mediaQueryData = MediaQuery(context);
//     width = _mediaQueryData.size.width;
//     width = _mediaQueryData.size.height;
//   }
// }
class MyWidget extends StatelessWidget {
  @override
  Widget build(context) {
    var size = MediaQuery.of(context).size;
    return Container(
        child: Column(children: [
      Text("Width: ${size.width}"),
      Text("Height: ${size.height}"),
    ]));
  }
}
