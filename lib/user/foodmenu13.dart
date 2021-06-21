import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:mlao/model/food_model.dart';
import 'package:mlao/model/groupfood_model.dart';
import 'package:mlao/model/user_model.dart';
import 'package:mlao/utility/my_constant.dart';
import 'package:mlao/utility/my_style.dart';

class FoodMenu extends StatefulWidget {
  final UserModel userModel;
  final GroupFoodModel groupFoodModel;
  FoodMenu({Key key, this.groupFoodModel, this.userModel}) : super(key: key);
  @override
  _FoodMenuState createState() => _FoodMenuState();
}

class _FoodMenuState extends State<FoodMenu> {
  UserModel userModel;
  GroupFoodModel groupFoodModel;
  String idShop, idGrp;
  int amount = 1;
  double lat1, lng1, lat2, lng2;
  Location location = Location();
  // ignore: deprecated_member_use
  List<FoodModel> foodModels = List();
  // ignore: deprecated_member_use
  List<GroupFoodModel> groupFoodModels = List();

  // ignore: deprecated_member_use
  List<UserModel> userModels = List();

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    groupFoodModel = widget.groupFoodModel;
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
    idGrp = groupFoodModel.id;
    idShop = groupFoodModel.idShop;
    String url =
        '${MyConstant().domain}/mlao/getGroupFoodWhereIdGrp.php?isAdd=true&idGrp=$idGrp&idShop=2';

    Response response = await Dio().get(url);
    // print('res --> $response');

    var result = json.decode(response.data);
    // print('result = $result');

    for (var map in result) {
      FoodModel foodModel = FoodModel.fromJson(map);
      setState(() {
        foodModels.add(foodModel);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return foodModels.length == 0
        ? MyStyle().showProgress()
        : GridView.extent(
            maxCrossAxisExtent: 220.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            children: List.generate(
              foodModels.length,
              (index) => GestureDetector(
                child: Row(
                  children: <Widget>[
                    showFoodImage(context, index),
                  ],
                ),
                onTap: () {
                  // print('You Click index = $index');
                  amount = 1;
                  confirmOrder(index);
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
              // padding: const EdgeInsets.all(8),
              width: 150.0,
              height: 80.0,
              child: Image.network(
                  '${MyConstant().domain}${foodModels[index].pathImage}'),
              // fit: BoxFit.cover,
              //  fit: BoxFit.scaleDown,
            ),
            new Text(
              foodModels[index].nameFood,
              style: MyStyle().mainTitle,
            ),
            Row(
              children: <Widget>[
                new Text(
                  // '₭ ${foodModels[index].price} /ກີບ',
                  '₭ ${foodModels[index].price} /',
                  style: MyStyle().mainTitle,
                ),
                Text(foodModels[index].detail),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<Null> confirmOrder(int index) async {
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                foodModels[index].nameFood,
                style: MyStyle().mainH2Title,
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: 210,
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage(
                        '${MyConstant().domain}${foodModels[index].pathImage}'),
                    // fit: BoxFit.cover),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.add_circle,
                      size: 36,
                      color: Colors.green,
                    ),
                    onPressed: () {
                      setState(() {
                        amount++;
                        // print('amount = $amount');
                      });
                    },
                  ),
                  Text(
                    amount.toString(),
                    style: MyStyle().mainTitle,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.remove_circle,
                      size: 36,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      if (amount > 1) {
                        setState(() {
                          amount--;
                        });
                      }
                    },
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    width: 110,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);

                        addOrderToCart(index);
                      },
                      child: Text(
                        'Order',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    width: 110,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<Null> addOrderToCart(int index) async {
    // String nameShop = userModel.nameShop;
    String idFood = foodModels[index].id;
    String nameFood = foodModels[index].nameFood;
    String price = foodModels[index].price;

    int priceInt = int.parse(price);
    int sumInt = priceInt * amount;

    // lat2 = double.parse(userModel.lat);
    // lng2 = double.parse(userModel.lng);
    // double distance = MyAPI().calculateDistance(lat1, lng1, lat2, lng2);

    // var myFormat = NumberFormat('###.0#', 'en_US');
    // String distanceString = myFormat.format(distance);

    // int transport = MyAPI().calculateTransport(distance);
    print(
        'idShop = $idShop,  idFood = $idFood, nameFood = $nameFood, price = $price, amount = $amount, sum = $sumInt');

    // print(
    //     'idShop = $idShop, nameShop = $nameShop, idFood = $idFood, nameFood = $nameFood, price = $price, amount = $amount, sum = $sumInt, distance = $distanceString, transport = $transport');

    //   Map<String, dynamic> map = Map();

    //   map['idShop'] = idShop;
    //   map['nameShop'] = nameShop;
    //   map['idFood'] = idFood;
    //   map['nameFood'] = nameFood;
    //   map['price'] = price;
    //   map['amount'] = amount.toString();
    //   map['sum'] = sumInt.toString();
    //   map['distance'] = distanceString;
    //   map['transport'] = transport.toString();

    //   print('map ==> ${map.toString()}');

    //   CartModel cartModel = CartModel.fromJson(map);

    //   var object = await SQLiteHelper().readAllDataFromSQLite();
    //   print('object lenght = ${object.length}');

    //   if (object.length == 0) {
    //     await SQLiteHelper().insertDataToSQLite(cartModel).then((value) {
    //       print('Insert Success');
    //       showToast('Insert Success');
    //     });
    //   } else {
    //     String idShopSQLite = object[0].idShop;
    //     print('idShopSQLite ==> $idShopSQLite');
    //     if (idShop == idShopSQLite) {
    //       await SQLiteHelper().insertDataToSQLite(cartModel).then((value) {
    //         print('Insert Success');
    //         showToast('Insert Success');
    //       });
    //     } else {
    //       normalDialog(context,
    //           'ກະຕ່າ ມີລາຍການສິນຄ້າຂອງຮ້ານນີ້ ${object[0].nameShop}ກະລຸນາຊື້ຈາກຮ້ານນີ້ໃຫ້ ສຳເລັດກ່ອນ');
    //     }
    //   }
  }

  // void showToast(String string) {
  //   // Toast.show(
  //   //   string,
  //   //   context,
  //   //   duration: Toast.LENGTH_LONG,
  //   // );
  // }
}
