import 'package:flutter/material.dart';
import 'package:mlao/providers/amount_cart_provider.dart';
import 'package:mlao/user/body.dart';
import 'package:mlao/utility/sqlite_helper.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mlao/shop/show_cart.dart';
import 'package:mlao/utility/my_style.dart';
import 'package:mlao/utility/signout_process.dart';
import 'package:mlao/user/show_list_shop_all01.dart';
import 'package:mlao/user/show_status_food_order.dart';

class MainUser extends StatefulWidget {
  @override
  _MainUserState createState() => _MainUserState();
}

class _MainUserState extends State<MainUser> {
  String nameUser;
  Widget currentWidget;
  int amount = 0;

  @override
  void initState() {
    super.initState();
    currentWidget = Bodys();
    findUser();
    checkAmunt();
  }

  Future<Null> checkAmunt() async {
    await SQLiteHelper().readAllDataFromSQLite().then((value) {
      int i = value.length;
      setState(() {
        amount = i;
      });    
    });
  }

  Future<Null> findUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      nameUser = preferences.getString('Name');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nameUser == null ? 'Main User' : 'login  $nameUser'),
        actions: <Widget>[
          MyStyle().iconShowCart(
            context,
            amount,
          ),
        ],
      ),
      drawer: showDrawer(),
      body: currentWidget,
    );
  }

  Drawer showDrawer() => Drawer(
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                showHead(),
                menuListShop(),
                menuCart(),
                menuStatusFoodOrder(),
                // groupMenu(),
                // ffood(),
                // body(),
                // fcat(),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                menuSignOut(),
              ],
            ),
          ],
        ),
      );

  ListTile menuListShop() {
    return ListTile(
      onTap: () {
        Navigator.pop(context);
        setState(() {
          currentWidget = ShowListShopAll();
        });
      },
      leading: Icon(Icons.home),
      title: Text('ສະແດງຮ້ານຄ້າ'),
      subtitle: Text('ສະແດງຮ້ານຄ້າ ທີ່ສາມາດສັ່ງໄດ້'),
    );
  }

  // ListTile groupMenu() => ListTile(
  //       leading: Icon(Icons.fastfood),
  //       title: Text('ໝວດສິນຄ້າ'),
  //       subtitle: Text('ລາການໝວດສິນຄ້າຂອງທ່າ'),
  //       onTap: () {
  //         setState(() {
  //           currentWidget = HomeGroup();
  //         });
  //         Navigator.pop(context);
  //       },
  //     );
  // ListTile body() => ListTile(
  //       leading: Icon(Icons.fastfood),
  //       title: Text('body'),
  //       subtitle: Text('ລາການໝວດສິນຄ້າຂອງທ່າ'),
  //       onTap: () {
  //         setState(() {
  //           currentWidget = Bodys();
  //         });
  //         Navigator.pop(context);
  //       },
  //     );
  ListTile menuStatusFoodOrder() {
    return ListTile(
      onTap: () {
        Navigator.pop(context);
        setState(() {
          currentWidget = ShowStatusFoodOrder();
        });
      },
      leading: Icon(Icons.bookmark_border),
      title: Text('ສະແດງລາຍການສິນຄ້າທີ່ສັ່ງ'),
      subtitle:
          Text('ສະແດງລາຍການສິນຄ້າທີ່ສັ່ງ ແລະ ເບີ່ງຂໍ້ມູນລາຍການສິນຄ້າທີ່ສັ່ງ'),
    );
  }

  Widget menuSignOut() {
    return Container(
      decoration: BoxDecoration(color: Colors.green),
      child: ListTile(
        onTap: () => signOutProcess(context),
        leading: Icon(
          Icons.exit_to_app,
          color: Colors.white,
        ),
        title: Text(
          'Sign Out',
          style: TextStyle(color: Colors.white),
        ),
        // subtitle: Text(
        //   'ອອກ',
        //  style: TextStyle(color: Colors.white),
        // ),
      ),
    );
  }

  UserAccountsDrawerHeader showHead() {
    return UserAccountsDrawerHeader(
      decoration: MyStyle().myBoxDecoration('user.jpg'),
      currentAccountPicture: MyStyle().showLogo(),
      accountName: Text(
        nameUser == null ? 'Name Login' : nameUser,
        style: TextStyle(color: MyStyle().darkColor),
      ),
      accountEmail: Text(
        'Login',
        style: TextStyle(color: MyStyle().primaryColor),
      ),
    );
  }

  Widget menuCart() {
    return ListTile(
      leading: Icon(Icons.shopping_cart),
      title: Text('ກະຕ່າ'),
      subtitle: Text('ສິຄ້າທີເລຶອກ ແຕ່ຍັງບໍ່ທັນສັ່ງ'),
      onTap: () {
        Navigator.pop(context);
        MaterialPageRoute route = MaterialPageRoute(
          builder: (context) => ShowCart(),
        );
        Navigator.push(context, route);
      },
    );
  }
}
