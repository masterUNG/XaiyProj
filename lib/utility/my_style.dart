import 'package:flutter/material.dart';
import 'package:mlao/shop/show_cart.dart';

class MyStyle {
  Color darkColor = Colors.green;
  Color primaryColor = Colors.green;

  Widget iconShowCart(BuildContext context) {
    return Container(
      child: Row(children: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
        SizedBox(width: 15),
        Stack(
          // ignore: deprecated_member_use
          overflow: Overflow.visible,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                MaterialPageRoute route = MaterialPageRoute(
                  builder: (context) => ShowCart(),
                );
                Navigator.push(context, route);
              },
            ),
            shownumber()
          ],
        )
      ]),
    );
  }

  Widget shownumber() {
    return Positioned(
      child: Container(
        width: 18,
        height: 18,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            border: Border.all(color: Colors.white, width: 1.5)),
        child: Text(
          "20",
          style: TextStyle(
            color: Colors.white,
            fontSize: 8,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget showProgress() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  TextStyle mainTitle = TextStyle(
    fontSize: 16.0,
    // fontWeight: FontWeight.bold,
    color: Colors.green,
  );
  TextStyle h2Style() => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: Colors.green.shade700,
      );
  TextStyle mainH2Title = TextStyle(
    fontSize: 14.0,
    // fontWeight: FontWeight.bold,
    color: Colors.green.shade700,
  );

  TextStyle h1Style() => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: Colors.green.shade700,
      );
  BoxDecoration myBoxDecoration(String namePic) {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage('images/$namePic'),
        fit: BoxFit.cover,
      ),
    );
  }

  SizedBox mySizebox() => SizedBox(
        width: 8.0,
        height: 16.0,
      );

  Widget titleCenter(BuildContext context, String string) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        child: Text(
          string,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Text showTitle(String title) => Text(
        title,
        style: TextStyle(
          fontSize: 24.0,
          color: Colors.green,
          fontWeight: FontWeight.bold,
        ),
      );

  Text showTitleH2(String title) => Text(
        title,
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.green,
          fontWeight: FontWeight.bold,
        ),
      );

  Text showTitleH3(String title) => Text(
        title,
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.green,
          fontWeight: FontWeight.w500,
        ),
      );

  Text showTitleH3White(String title) => Text(
        title,
        style: TextStyle(
          fontSize: 14.0,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      );

  Text showTitleH3Red(String title) => Text(
        title,
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.red.shade900,
          fontWeight: FontWeight.w500,
        ),
      );

  Text showTitleH3Purple(String title) => Text(
        title,
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.purple.shade700,
          fontWeight: FontWeight.w500,
        ),
      );

  Container showLogo() {
    return Container(
      width: 120.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Container showImages() {
    return Container(
      // height: 60,
      child: Image.asset('images/1111.png'),
    );
  }

  // MyStyle();
}
