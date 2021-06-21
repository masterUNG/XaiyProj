import 'package:flutter/material.dart';
import 'package:mlao/model/groupfood_model.dart';
import 'package:mlao/model/user_model.dart';
import 'package:mlao/shop/about_shop.dart';
// import 'package:mlao/user/foodCategory.dart';
import 'package:mlao/user/groupmenu002.dart';
import 'package:mlao/user/show_menu_food03.dart';
import 'package:mlao/utility/my_style.dart';
import 'package:mlao/utility/sqlite_helper.dart';

class ShowShopFoodMenu extends StatefulWidget {
  final UserModel userModel;
  ShowShopFoodMenu({Key key, this.userModel, GroupFoodModel groupFoodModel})
      : super(key: key);
  @override
  _ShowShopFoodMenuState createState() => _ShowShopFoodMenuState();
}

class _ShowShopFoodMenuState extends State<ShowShopFoodMenu> {
  UserModel userModel;
  // ignore: deprecated_member_use
  List<Widget> listWidgets = List();
  int indexPage = 0;

  int amount = 0;

  @override
  void initState() {
    super.initState();
    userModel = widget.userModel;

    checkAmunt();

    print('#### recive at show_shop_food_menu02 ==> ${userModel.nameShop}');

    listWidgets.add(HomeMenu(
      userModel: userModel,
    ));
    listWidgets.add(ShowMenuFood(
      userModel: userModel,
    ));

    listWidgets.add(AboutShop(
      userModel: userModel,
    ));
    // userModel = widget.userModel;
    // listWidgets.add(Group1(
    //   userModel: userModel,
    // ));
  }

  BottomNavigationBarItem showMenuFoodNav() {
    return BottomNavigationBarItem(
      icon: Icon(Icons.restaurant_menu),
      // ignore: deprecated_member_use
      title: Text('group'),
    );
  }

  BottomNavigationBarItem groupFood() {
    return BottomNavigationBarItem(
      icon: Icon(Icons.restaurant),
      // ignore: deprecated_member_use
      title: Text('ເມນູ ຂອງຮ້ານ'),
    );
  }

  BottomNavigationBarItem aboutShopNav() {
    return BottomNavigationBarItem(
      icon: Icon(Icons.restaurant),
      // ignore: deprecated_member_use
      title: Text('ຂໍ້ມູນຮ້ານ'),
    );
  }

  BottomNavigationBarItem groupFood1() {
    return BottomNavigationBarItem(
      icon: Icon(Icons.restaurant),
      // ignore: deprecated_member_use
      title: Text('ເມນູ ຂອງຮ້ານ'),
    );
  }

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
        actions: <Widget>[
          MyStyle().iconShowCart(
            context, amount
          )
        ],
        title: Text(userModel.nameShop),
      ),
      body:
          //  Column(children: <Widget>[
          //   ListTile(
          //     leading: Icon(Icons.fastfood),
          //     title: Text('ເລຶກໝວດສິນຄ້າທີ່ທ່ານຕ້ອງການ'),
          //     // onTap: () {
          //     //   currentWidget = ShowListShopAll();
          //     // },
          //   ),
          listWidgets.length == 0
              ? MyStyle().showProgress()
              : listWidgets[indexPage],
      bottomNavigationBar: showBottonNavigationBar(),
      // ]),
    );
  }

  BottomNavigationBar showBottonNavigationBar() => BottomNavigationBar(
        backgroundColor: Colors.green,
        selectedItemColor: Colors.white,
        currentIndex: indexPage,
        onTap: (value) {
          setState(() {
            indexPage = value;
          });
        },
        items: <BottomNavigationBarItem>[
          showMenuFoodNav(),
          groupFood(),
          aboutShopNav(),
          // groupFood1(),
        ],
      );
}
