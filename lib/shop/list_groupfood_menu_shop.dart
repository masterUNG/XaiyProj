import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mlao/model/groupfood_model.dart';
// import 'package:mlao/model/user_model.dart';
import 'package:mlao/shop/add_groupfood_menu.dart';
import 'package:mlao/shop/edit_groupfood_menu.dart';
// import 'package:mlao/shop/edit_food_menu.dart';
// import 'package:mlao/shop/edit_groupfood_menu.dart';
import 'package:mlao/utility/my_style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mlao/utility/my_constant.dart';

class ListGroupFoodMenu extends StatefulWidget {
  @override
  _ListGroupFoodMenuState createState() => _ListGroupFoodMenuState();
}

class _ListGroupFoodMenuState extends State<ListGroupFoodMenu> {
  bool loadStatus = true; // Process Load JSON
  bool status = true; // Have Data
  // ignore: deprecated_member_use
  List<GroupFoodModel> groupFoodModels = List();
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    readGroupFoodMenu();
  }

  Future<Null> readGroupFoodMenu() async {
    if (groupFoodModels.length != 0) {
      loadStatus = true;
      status = true;
      var groupFoodModels;
      groupFoodModels.clear();
    }

    SharedPreferences preferences = await SharedPreferences.getInstance();
    String idShop = preferences.getString('id');
    print('idShop = $idShop');
    String url =
        '${MyConstant().domain}/mlao/getGroupFoodWhereIdShop.php?isAdd=true&idShop=$idShop';
    await Dio().get(url).then((value) {
      setState(() {
        loadStatus = false;
      });
      if (value.toString() != 'null') {
        // print('value ==>> $value');

        var result = json.decode(value.data);
        print('result ==>> $result');

        for (var map in result) {
          GroupFoodModel groupFoodModel = GroupFoodModel.fromJson(map);
          setState(() {
            groupFoodModels.add(groupFoodModel);
          });
        }
      } else {
        setState(() {
          status = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        loadStatus ? MyStyle().showProgress() : showContent(),
        addMenuButton(),
      ],
    );
  }

  Widget showContent() {
    return status
        // ? Text('ຍັງບໍ່ມີໝວດສິນຄ້າ')
        ? showListGroupFood()
        : Center(
            child: Text('ຍັງບໍ່ມີໝວດສິນຄ້າ'),
          );
  }

  Widget showListGroupFood() => ListView.builder(
        itemCount: groupFoodModels.length,
        itemBuilder: (context, index) => Card(
          child: Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.width * 0.3,
                child: Image.network(
                  '${MyConstant().domain}${groupFoodModels[index].pathImage}',
                  // fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.width * 0.3,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        groupFoodModels[index].nameGroup,
                        style: MyStyle().mainTitle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: Colors.green,
                            ),
                            onPressed: () {
                              MaterialPageRoute route = MaterialPageRoute(
                                builder: (context) => EditGoupFoodMenu(
                                  groupFoodModel: groupFoodModels[index],
                                ),
                              );
                              Navigator.push(context, route)
                                  .then((value) => readGroupFoodMenu());
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () =>
                                deleateFood(groupFoodModels[index]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Future<Null> deleateFood(GroupFoodModel groupFoodModel) async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: MyStyle().showTitleH2(
            'ທ່ານຕ້ອງການລົບເມນູນີ້ແທ້ບໍ ${groupFoodModel.nameGroup} ?'),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ElevatedButton(
                onPressed: () async {
                  Navigator.pop(context);
                  String url =
                      '${MyConstant().domain}/mlao/deleteGroupFoodWhereId.php?isAdd=true&id=${groupFoodModel.id}';
                  await Dio().get(url).then((value) => readGroupFoodMenu());
                },
                child: Text('ຍອມຮັບ'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('ປະຕິເສດ'),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget addMenuButton() => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 16.0, right: 16.0),
                child: FloatingActionButton(
                  onPressed: () {
                    MaterialPageRoute route = MaterialPageRoute(
                      builder: (context) => AddGroupFoodMenu(),
                    );
                    Navigator.push(context, route)
                        .then((value) => readGroupFoodMenu());
                  },
                  child: Icon(Icons.add),
                ),
              ),
            ],
          ),
        ],
      );
}
