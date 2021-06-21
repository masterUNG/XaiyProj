import 'package:flutter/material.dart';
import 'package:mlao/model/groupfood_model.dart';
import 'package:mlao/model/user_model.dart';
import 'package:mlao/utility/my_style.dart';
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
    // userModel = widget.userModel;
    groupFoodModel = widget.groupFoodModel;
    listWidgets.add(FoodMenu(
      groupFoodModel: groupFoodModel,
      userModel: userModel,
    ));
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[MyStyle().iconShowCart(context)],
        title: Row(
          children: [
            Text(groupFoodModel.nameGroup),
            // Text(userModel.id),
          ],
        ),
      ),
      body: listWidgets.length == 0
          ? MyStyle().showProgress()
          : listWidgets[indexPage],
      bottomNavigationBar: showBottonNavigationBar(),
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
