import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:mlao/model/food_model.dart';
// import 'package:mlao/model/groupfood_model.dart';
import 'package:mlao/model/user_model.dart';
import 'package:mlao/user/show_shop_food_menu02.dart';
// import 'package:mlao/user/show_list_shop_all.dart';
import 'package:mlao/utility/my_constant.dart';
import 'package:mlao/utility/my_style.dart';

// import 'package:mlao/utility/my_style.dart';
class Bodys extends StatefulWidget {
  @override
  _BodysState createState() => _BodysState();
}

class _BodysState extends State<Bodys> {
  // ignore: deprecated_member_use
  List<UserModel> userModels = List();
  // ignore: deprecated_member_use
  List<Widget> shopCards = List();
  Widget currentWidget;
  @override
  void initState() {
    super.initState();

    readShop();
  }

  Future<Null> readShop() async {
    //  idShop == userModel.id;
    String url =
        '${MyConstant().domain}/mlao/getUserWhereChooseType.php?isAdd=true&ChooseType=Shop';
    await Dio().get(url).then((value) {
      // print('value = $value');
      var result = json.decode(value.data);
      int index = 0;
      for (var map in result) {
        UserModel model = UserModel.fromJson(map);

        String nameShop = model.nameShop;
        if (nameShop.isNotEmpty) {
          print('NameShop = ${model.nameShop}');
          setState(() {
            userModels.add(model);
            shopCards.add(createCard(model, index));
            index++;
          });
        }
      }
    });
  }

  Widget createCard(UserModel userModel, int index) {
    return GestureDetector(
      onTap: () {
        print('You Click index $index');
        MaterialPageRoute route = MaterialPageRoute(
          builder: (context) => ShowShopFoodMenu(
            userModel: userModels[index],
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
                  '${MyConstant().domain}${userModel.urlPicture}'),
            ),
            MyStyle().mySizebox(),
            Container(
              width: 130,
              child: MyStyle().showTitleH3(userModel.nameShop),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Wrap(
        children: <Widget>[
          MyStyle().showImages(),
          ListTile(
            leading: Icon(Icons.fastfood),
            title: Text('ເລຶອກຮ້ານຄ້າທີໃກ້ບ້ານທ່ານ'),
            // onTap: () {
            //   currentWidget = ShowListShopAll();
            // },
          ),
          shopCards.length == 0
              ? MyStyle().showProgress()
              : Wrap(
                  children: [
                    Container(
                      height: 450,
                      child: GridView.extent(
                        maxCrossAxisExtent: 220.0,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                        children: shopCards,
                      ),
                    ),
                  ],
                ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        // ignore: deprecated_member_use
        child: RaisedButton(
          onPressed: () {},
          color: Colors.green,
          textColor: Colors.white,
          child: Text('ຂໍອະໄພແອບຂອງພວກເຮົາກຳລັງພັດທະນາ'),
        ),
      ),
    );
  }
}
