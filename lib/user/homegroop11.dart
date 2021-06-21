import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mlao/model/groupfood_model.dart';
import 'package:mlao/user/showfood12.dart';

import 'package:mlao/utility/my_constant.dart';
import 'package:mlao/utility/my_style.dart';

class HomeGroup extends StatefulWidget {
  @override
  _HomeGroupState createState() => _HomeGroupState();
}

class _HomeGroupState extends State<HomeGroup> {
// ignore: deprecated_member_use
  List<GroupFoodModel> groupFoodModels = List();

  // ignore: deprecated_member_use
  List<Widget> shopMenu = List();
  Widget currentWidget;
  @override
  void initState() {
    super.initState();

    readMenu();
  }

  Future<Null> readMenu() async {
    //  idShop == userModel.id;
    String url =
        '${MyConstant().domain}/mlao/getGroupFoodWhereIdShop.php?isAdd=true&idShop=2';
    await Dio().get(url).then((value) {
      // print('value = $value');
      var result = json.decode(value.data);
      int index = 0;
      for (var map in result) {
        GroupFoodModel model = GroupFoodModel.fromJson(map);

        String nameGroup = model.nameGroup;
        if (nameGroup.isNotEmpty) {
          print('nameGroup = ${model.nameGroup}');
          setState(() {
            groupFoodModels.add(model);
            shopMenu.add(createMenu(model, index));
            index++;
          });
        }
      }
    });
  }

  Widget createMenu(GroupFoodModel groupFoodModel, int index) {
    return GestureDetector(
      onTap: () {
        print('You Click index $index');
        MaterialPageRoute route = MaterialPageRoute(
          builder: (context) => Showfood(
            groupFoodModel: groupFoodModels[index],
          ),
        );
        Navigator.push(context, route);
      },
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 90.0,
              height: 70.0,
              child: Image.network(
                  '${MyConstant().domain}${groupFoodModel.pathImage}'),
            ),
            MyStyle().mySizebox(),
            Container(
              width: 130,
              child: MyStyle().showTitleH3(groupFoodModel.nameGroup),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          MyStyle().showImages(),
          ListTile(
            leading: Icon(Icons.fastfood),
            title: Text('ເລຶກໝວດສິນຄ້າທີ່ທ່ານຕ້ອງການ'),
            // onTap: () {
            //   currentWidget = ShowListShopAll();
            // },
          ),
          shopMenu.length == 0
              ? MyStyle().showProgress()
              : Container(
                  height: 160,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    // maxCrossAxisExtent: 220.0,
                    // mainAxisSpacing: 10.0,
                    // crossAxisSpacing: 10.0,
                    children: shopMenu,
                  ),
                ),
          ListTile(
            leading: Icon(Icons.apps),
            title: Text('ສິນຄ້າທັງຫມົດ'),
            // onTap: () {
            //   currentWidget = ShowListShopAll();
            // },
          ),
          Expanded(
            child: Container(
                height: 180,
                child: GridView.extent(
                  maxCrossAxisExtent: 220.0,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  children: shopMenu,
                )),
          ),
        ],
      ),
    );
  }
}
