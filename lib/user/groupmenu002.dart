import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:mlao/model/groupfood_model.dart';
import 'package:mlao/model/user_model.dart';
import 'package:mlao/user/showfood12.dart';
import 'package:mlao/utility/my_constant.dart';
import 'package:mlao/utility/my_style.dart';

class HomeMenu extends StatefulWidget {
  final UserModel userModel;
  HomeMenu({Key key, this.userModel}) : super(key: key);
  @override
  _HomeMenuState createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  UserModel userModel;
  String idShop;
  int amount = 1;
  double lat1, lng1, lat2, lng2;
  Location location = Location();
  // ignore: deprecated_member_use
  List<GroupFoodModel> groupFoodModels = List();

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    userModel = widget.userModel;
    readFoodMenu();
    findLocation();
  }

  Future<Null> findLocation() async {
    location.onLocationChanged.listen((event) {
      lat1 = event.latitude;
      lng1 = event.longitude;
      // print('lat1= $lat1, lng1 = $lng1');
    });
  }

  Future<Null> readFoodMenu() async {
    idShop = userModel.id;
    String url =
        '${MyConstant().domain}/mlao/getGroupFoodWhereIdShop.php?isAdd=true&idShop=$idShop';
    Response response = await Dio().get(url);
    // print('res --> $response');

    var result = json.decode(response.data);
    // print('result = $result');

    for (var map in result) {
      GroupFoodModel groupFoodModel = GroupFoodModel.fromJson(map);
      setState(() {
        groupFoodModels.add(groupFoodModel);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return groupFoodModels.length == 0
        ? MyStyle().showProgress()
        : GridView.extent(
            maxCrossAxisExtent: 220.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            padding: const EdgeInsets.all(10),
            children: List.generate(
              groupFoodModels.length,
              (index) => GestureDetector(
                child: Wrap(
                  children: [
                    showFoodImage(context, index),
                  ],
                ),
                onTap: () {
                  print('You Click index $index');
                  MaterialPageRoute route = MaterialPageRoute(
                    builder: (context) => Showfood(
                      groupFoodModel: groupFoodModels[index],
                    ),
                  );
                  Navigator.push(context, route);
                },
              ),
            ),
          );
  }

  Container showFoodImage(BuildContext context, int index) {
    return Container(
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              // width: 80.0,
              // height: 80.0,
              // padding: const EdgeInsets.all(5),
              width: 180.0,
              height: 140.0,
              child: Image.network(
                  '${MyConstant().domain}${groupFoodModels[index].pathImage}'),
              // fit: BoxFit.cover,
              //  fit: BoxFit.scaleDown,
            ),
            new Text(
              groupFoodModels[index].nameGroup,
              style: MyStyle().mainTitle,
            ),
            // MyStyle().mySizebox(),
            // Container(
            //   // width: 90,
            //   child: Center(
            //     child: Text(
            //       groupFoodModels[index].nameGroup,
            //       style: MyStyle().mainH2Title,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
