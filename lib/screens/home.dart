import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:mlao/model/user_model.dart';
import 'package:mlao/screens/main_rider.dart';
import 'package:mlao/screens/main_shop.dart';
import 'package:mlao/screens/main_user.dart';
import 'package:mlao/screens/register.dart';
// import 'package:mlao/screens/signup.dart';
import 'package:mlao/utility/my_constant.dart';
import 'package:mlao/utility/my_style.dart';
import 'package:mlao/utility/normal_dialog.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //String get data => null;
  String user, password;
  bool statusLogin = true; // true => Non Login
  String nameUser;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    checkStatusLogin();
    findUser();
    checkPreferance();
  }

  Future<Null> checkPreferance() async {
    try {
      FirebaseMessaging firebaseMessaging = FirebaseMessaging();
      String token = await firebaseMessaging.getToken();
      print('token ====>>> $token');

      SharedPreferences preferences = await SharedPreferences.getInstance();
      String chooseType = preferences.getString('ChooseType');
      String idLogin = preferences.getString('id');
      print('idLogin = $idLogin');

      if (idLogin != null && idLogin.isNotEmpty) {
        String url =
            '${MyConstant().domain}/mlao/editTokenWhereId.php?isAdd=true&id=$idLogin&Token=$token';
        await Dio()
            .get(url)
            .then((value) => print('###### Update Token Success #####'));
      }

      // if (chooseType != null && chooseType.isNotEmpty) {
      if (chooseType == 'ຜູ້ໃຊ້') {
        routeToService(MainUser());
      } else if (chooseType == 'ຮ້ານຄ້າ') {
        routeToService(MainShop());
      } else if (chooseType == 'ຜູ້ສົງອາຫານ') {
        routeToService(MainRider());
      } else {
        // normalDialog(context, 'Error User Type');
      }
      // }
    } catch (e) {}
  }

  void routeToService(Widget myWidget) {
    MaterialPageRoute route = MaterialPageRoute(
      builder: (context) => myWidget,
    );
    Navigator.pushAndRemoveUntil(context, route, (route) => false);
  }

  Future<Null> findUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      nameUser = preferences.getString('Name');
    });
  }

  Future<Null> checkStatusLogin() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String type = preferences.getString('ChooseType');
      if (type != null) {
        user = preferences.getString('User');
        password = preferences.getString('Password');
        statusLogin = false;
        checkAuthen();
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // backgroundColor: Colors.green,
          // title: Text('ເຂົ້າສູ່ລະບົບ',
          //     style: TextStyle(
          //       fontSize: 20.0,
          //       color: Colors.black,
          //     )),
          ),
      body: Container(
        // decoration: BoxDecoration(
        //   gradient: RadialGradient(
        //     colors: <Color>[Colors.white, MyStyle().primaryColor],
        //     center: Alignment(0, -0.3),
        //     radius: 1.0,
        //   ),
        // ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                MyStyle().showLogo(),
                MyStyle().mySizebox(),
                MyStyle().showTitle('Meuanglaofood'),
                // Mystyle().showTitleH3Purple('ตำบลแพรกหา อำเภอควนขนุน จังหวัดพัทลุง'),
                MyStyle().mySizebox(),
                usernameForm(),
                MyStyle().mySizebox(),
                //ปุ่มล็อคอิน
                passwordForm(),
                MyStyle().mySizebox(),
                loginButton(),
                buildFlatButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  ElevatedButton buildFlatButton() {
    return ElevatedButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Register(),
        ),
      ),
      child: Text(
        'ສະໝັກສະມາຊິກ',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget loginButton() => Container(
        width: 250.0,
        child: ElevatedButton(
          // color: Mystyle().darkColor,
          onPressed: () {
/*Navigator.push(context,
MaterialPageRoute(builder: (context) => MainShop()));*/
            if (user == null ||
                user.isEmpty ||
                password == null ||
                password.isEmpty) {
              normalDialog(context, 'ກະລຸນາໃສ່ຂໍ້ມູນໃຫ້ຄົບ');
            } else {
              checkAuthen();
            }
          },
          child: Text(
            'ເຂົ້າສູ່ລະບົບ',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );

  Future<Null> checkAuthen() async {
    String url =
        '${MyConstant().domain}/mlao/getUserWhereUser.php?isAdd=true&User=$user';
    print('url ===>> $url');
    try {
      Response response = await Dio().get(url);
      print('res = $response');

      var result = json.decode(response.data);
      print('result =$result');
      for (var map in result) {
        UserModel userModel = UserModel.fromJson(map);
        if (password == userModel.password) {
          String chooseType = userModel.chooseType;
          checkTypeAndRoute(chooseType, userModel);
        } else {
          normalDialog(context, 'ຜູ້ໃຊ້ແລະລະຫັດຜ່ານບໍ່ຖຶກຕ້ອງກະລຸນາລອງໄໝ່');
        }
      }
    } catch (e) {}
  }

  void checkTypeAndRoute(String chooseType, UserModel userModel) {
    if (chooseType == 'Shop') {
      routeTuService(MainShop(), userModel);
    } else if (chooseType == 'User') {
      routeTuService(MainUser(), userModel);
    } else if (chooseType == 'Rider') {
      routeTuService(MainRider(), userModel);
    } else {
      normalDialog(context, 'Error');
    }
  }

  Future<Null> routeTuService(Widget myWidget, UserModel userModel) async {
    if (statusLogin) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('id', userModel.id);
      preferences.setString('ChooseType', userModel.chooseType);
      preferences.setString('Name', userModel.name);
      preferences.setString('User', userModel.user);
      preferences.setString('Password', userModel.password);
    }

    MaterialPageRoute route = MaterialPageRoute(
      builder: (context) => myWidget,
    );
    Navigator.pushAndRemoveUntil(context, route, (route) => false);
  }

  //กรอบเข้าสู่ระบบ
  Widget usernameForm() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => user = value.trim(),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.account_box,
              color: MyStyle().darkColor,
            ),
            labelStyle: TextStyle(color: MyStyle().darkColor),
            labelText: 'ຜູ້ໃຊ້ :',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().darkColor)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().primaryColor)),
          ),
        ),
      );

  Widget passwordForm() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => password = value.trim(),
          obscureText: true,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock,
              color: MyStyle().darkColor,
            ),
            labelStyle: TextStyle(color: MyStyle().darkColor),
            labelText: 'ລະຫັດຜ່ານ :',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().darkColor)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().primaryColor)),
          ),
        ),
      );
}
