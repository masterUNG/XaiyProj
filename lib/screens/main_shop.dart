import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:mlao/shop/list_groupfood_menu_shop.dart';
// import 'package:mlao/user/listMenu.dart';
import 'package:mlao/utility/my_style.dart';
import 'package:mlao/utility/normal_dialog.dart';
import 'package:mlao/utility/signout_process.dart';
import 'package:mlao/shop/infomation_shop.dart';
import 'package:mlao/shop/list_food_manu_shop.dart';
// import 'package:mlao/widget/list_groupfood_menu_shop.dart';
// import 'package:mlao/user/group.dart';
import 'package:mlao/shop/order_list_shop.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainShop extends StatefulWidget {
  @override
  _MainShopState createState() => _MainShopState();
}

class _MainShopState extends State<MainShop> {
  // Field
  Widget currentWidget = OrderListShop();

  String nameUser;
  @override
  void initState() {
    super.initState();
    aboutNotification();

    findUser();
  }

  Future<Null> findUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      nameUser = preferences.getString('Name');
    });
  }

  Future<Null> aboutNotification() async {
    if (Platform.isAndroid) {
      print('aboutNoti Work Android');

      FirebaseMessaging firebaseMessaging = FirebaseMessaging();
      // ignore: await_only_futures
      await firebaseMessaging.configure(
        onLaunch: (message) async {
          print('Noti onLaunch');
        },
        onResume: (message) async {
          String title = message['data']['title'];
          String body = message['data']['body'];
          print('Noti onResume ${message.toString()}');
          print('title = $title, body = $body');
          normalDialog2(context, title, body);
        },
        onMessage: (message) async {
          print('Noti onMessage ${message.toString()}');
          String title = message['notification']['title'];
          String notiMessage = message['notification']['body'];
          normalDialog2(context, title, notiMessage);
        },
      );
    } else if (Platform.isIOS) {
      print('aboutNoti Work iOS');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Shop'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => signOutProcess(context),
          )
        ],
      ),
      drawer: showDrawer(),
      body: currentWidget,
    );
  }

  Drawer showDrawer() => Drawer(
        child: ListView(
          children: <Widget>[
            showHead(),
            // listMenu(),
            homeMenu(),
            groupFoodMenu(),
            foodMenu(),
            infomationMenu(),
            signOutMenu(),
          ],
        ),
      );
  ListTile homeMenu() => ListTile(
        leading: Icon(Icons.home),
        title: Text('ລາຍການສິນຄ້າທີ່ລູກຄ້າສັ່ງ'),
        onTap: () {
          setState(() {
            currentWidget = OrderListShop();
          });
          Navigator.pop(context);
        },
      );
  ListTile groupFoodMenu() => ListTile(
        leading: Icon(Icons.fastfood),
        title: Text('ໝວດສິນຄ້າ'),
        subtitle: Text('ລາການໝວດສິນຄ້າຂອງທ່າ'),
        onTap: () {
          setState(() {
            currentWidget = ListGroupFoodMenu();
          });
          Navigator.pop(context);
        },
      );
  ListTile foodMenu() => ListTile(
        leading: Icon(Icons.fastfood),
        title: Text('ລາການສິນຄ້າ'),
        subtitle: Text('ລາການສິນຄ້າ ຂອງຮ້ານ'),
        onTap: () {
          setState(() {
            currentWidget = ListFoodMenuShop();
          });
          Navigator.pop(context);
        },
      );

  ListTile infomationMenu() => ListTile(
        leading: Icon(Icons.info),
        title: Text('ຂໍ້ມູນຮ້ານ'),
        subtitle: Text('ຂໍ້ມູນຮ້ານ ພ້ອມ Edit'),
        onTap: () {
          setState(() {
            currentWidget = InfomationShop();
          });
          Navigator.pop(context);
        },
      );

  ListTile signOutMenu() => ListTile(
        leading: Icon(Icons.exit_to_app),
        title: Text('ອອກ'),
        subtitle: Text('ອອກ ເພຶ່ອ ກັບໄປສູ່ ໜ້າທຳອິດ'),
        onTap: () => signOutProcess(context),
      );

  UserAccountsDrawerHeader showHead() {
    return UserAccountsDrawerHeader(
      decoration: MyStyle().myBoxDecoration('shop.jpg'),
      currentAccountPicture: MyStyle().showLogo(),
      accountName: Text(
        nameUser == null ? 'Name Login' : nameUser,
        style: TextStyle(color: MyStyle().darkColor),
      ),
      accountEmail: Text(
        'ກຳລັງໃຊ້ງານ',
        style: TextStyle(color: MyStyle().primaryColor),
      ),
    );
  }
}
