import 'package:flutter/material.dart';
import 'package:mlao/model/groupfood_model.dart';
import 'package:mlao/model/user_model.dart';
import 'package:mlao/utility/my_style.dart';
import 'package:mlao/utility/sqlite_helper.dart';
// import 'about_shop.dart';
import 'foodmenu13.dart';

class Showfood extends StatefulWidget {
  final UserModel userModel;
  final GroupFoodModel groupFoodModel;
  Showfood({Key key, this.groupFoodModel, this.userModel}) : super(key: key);
  @override
  _ShowfoodState createState() => _ShowfoodState();
}

class _ShowfoodState extends State<Showfood> {
  GroupFoodModel groupFoodModel;
  UserModel userModel;
  String idShop, idGrp;
  // ignore: deprecated_member_use
  List<Widget> listWidgets = List();
  int indexPage = 0;

  // get idShop => userModel.nameShop;

  @override
  void initState() {
    super.initState();
    userModel = widget.userModel;
    print('#### Name login = ${userModel.toJson()}');
    groupFoodModel = widget.groupFoodModel;
    print('##### groupFoodModel nameGroup ===>> ${groupFoodModel.toJson()}');

    checkAmunt();

    // listWidgets.add(FoodMenu(
    //   groupFoodModel: groupFoodModel,
    //   userModel: userModel,
    // ));
    // listWidgets.add(HomeMenu(
    //   groupFoodModel: groupFoodModel,
    // ));
    userModel = widget.userModel;
    listWidgets.add(FoodMenu(
      userModel: userModel,
    ));
  }

  BottomNavigationBarItem showMenuFoodNav() {
    return BottomNavigationBarItem(
      icon: Icon(Icons.restaurant_menu),
      // ignore: deprecated_member_use
      title: Text('ສິນຄ້າທັ້ງໝົດ'),
    );
  }

  BottomNavigationBarItem aboutShopNav() {
    return BottomNavigationBarItem(
      icon: Icon(Icons.restaurant),
      // ignore: deprecated_member_use
      title: Text('ສິນຄ້າທັ້ງໝົດ'),
    );
  }

  int amount = 0;

  Future<Null> checkAmunt() async {
    await SQLiteHelper().readAllDataFromSQLite().then((value) {
      int i = value.length;
      setState(() {
        amount = i;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[MyStyle().iconShowCart(context, amount)],
        title: Row(
          children: [
            Text(groupFoodModel.nameGroup),
            // Text(userModel.id),
          ],
        ),
      ),
      body: FoodMenu(
        groupFoodModel: groupFoodModel,
        userModel: userModel,
      ),
    );
  }

  BottomNavigationBar showBottonNavigationBar() => BottomNavigationBar(
        backgroundColor: Colors.green,
        selectedItemColor: Colors.white,
        currentIndex: indexPage,
        onTap: (value) {
          setState(() {
            indexPage = value;
            // print('idShop = $idShop');
          });
        },
        items: <BottomNavigationBarItem>[
          showMenuFoodNav(),
          aboutShopNav(),
        ],
      );
}
