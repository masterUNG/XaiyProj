import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mlao/model/order_model.dart';
import 'package:mlao/utility/my_constant.dart';
import 'package:mlao/utility/my_dialog.dart';
import 'package:mlao/utility/my_style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:steps_indicator/steps_indicator.dart';

class WaitShopCheckOrder extends StatefulWidget {
  const WaitShopCheckOrder({Key key}) : super(key: key);

  @override
  _WaitShopCheckOrderState createState() => _WaitShopCheckOrderState();
}

class _WaitShopCheckOrderState extends State<WaitShopCheckOrder> {
  int showTime = 0;
  String idUser;

  List<OrderModel> orderModels = [];

  @override
  void initState() {
    super.initState();
    findIdUser();
    // countTime();
  }

  Future<Null> findIdUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    idUser = preferences.getString('id');

    String apiGetOrderWhereIdUser =
        '${MyConstant().domain}/mlao/getOrderWhereIdUserLast.php?isAdd=true&idUser=$idUser';
    await Dio().get(apiGetOrderWhereIdUser).then((value) {
      if (value.toString() != 'null') {
        for (var item in json.decode(value.data)) {
          OrderModel model = OrderModel.fromJson(item);
          if (!((model.status == 'Finish') ||
              (model.status == 'CancelOrder'))) {
            setState(() {
              orderModels.add(model);
            });
          }
        }
      } else {
        // Status No Order
      }
    });
  }

  Future<Null> countTime() async {
    Duration duration = Duration(seconds: 1);
    await Timer(duration, () {
      callBackCountTime();
    });
  }

  Future<Null> callBackCountTime() async {
    String Status = 'UserOrder';
    String apiCheckStatus =
        '${MyConstant().domain}/mlao/getOrderWhereIdUserAnStatus.php?isAdd=true&idUser=$idUser&Status=$Status';

    await Dio().get(apiCheckStatus).then((value) {
      if (value.toString() == 'null') {
        // Status != 'UserOrder'
        MyDialog().noTimeDialog(context, 'Status Change');
      }
    });

    if (showTime < 60) {
      setState(() {
        showTime++;
      });
      countTime();
    } else {
      threadTimeOut('TimeOut', 'Shop Not Receive Time Out');
    }
  }

  Future<Null> threadTimeOut(String status2, String message) async {
    String status = 'UserOrder';
    String apiEditStatus =
        '${MyConstant().domain}/mlao/editOrderWhereIdUserAnStatus.php?isAdd=true&idUser=$idUser&Status=$status&Status2=$status2';
    await Dio()
        .get(apiEditStatus)
        .then((value) => MyDialog().noTimeDialog(context, message));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wait Shop Check Order'),
      ),
      body:
          orderModels.length == 0 ? MyStyle().showProgress() : buildListOrder(),
    );
  }

  int showStep(String status) {
    switch (status) {
      case 'UserOrder':
        return 0;
        break;
      case 'ReceiveOrder':
        return 1;
        break;
      case 'RiderOrder':
        return 2;
        break;
      default:
        return 0;
    }
  }

  Widget buildListOrder() => ListView.builder(
        itemCount: orderModels.length,
        itemBuilder: (context, index) => Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(orderModels[index].orderDateTime),
              StepsIndicator(
                selectedStepColorIn: Colors.green,
                
                lineLength: 80,
                nbSteps: 4,
                selectedStep: showStep(orderModels[index].status),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Order'),
                  Text('Receive'),
                  Text('Rider'),
                  Text('Finish'),
                ],
              ),
            ],
          ),
        ),
      );
}
