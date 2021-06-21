import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mlao/utility/my_constant.dart';
import 'package:mlao/utility/my_style.dart';
import 'package:mlao/utility/normal_dialog.dart';

class AddGroupFoodMenu extends StatefulWidget {
  @override
  _AddGroupFoodMenuState createState() => _AddGroupFoodMenuState();
}

class _AddGroupFoodMenuState extends State<AddGroupFoodMenu> {
  File file;
  String nameGroup;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ເພີ່ມໝວດສິນຄ້າ'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            showTitleFood('ຮູບພາບໝວດສິນຄ່າ'),
            groupFoodImage(),
            showTitleFood('ລາຍລະອຽດສິນຄ້າ'),
            nameGroupForm(),
            MyStyle().mySizebox(),
            saveButton()
          ],
        ),
      ),
    );
  }

  Widget saveButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton.icon(
        onPressed: () {
          if (file == null) {
            normalDialog(context,
                'ກະລຸນາເລືອກຮູບພາບອາຫານ ໂດຍການ ເລຶອກທີ່ Camera ຫລື Gallery');
          } else if (nameGroup == null || nameGroup.isEmpty) {
            normalDialog(context, 'ກະລຸນາໃສ່ຂໍ້ມູນໃຫ້ຄົບ');
          } else {
            uploadGroupFoodAndInsertData();
          }
        },
        icon: Icon(
          Icons.save,
          color: Colors.white,
        ),
        label: Text(
          'ບັນທຶກ',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Future<Null> uploadGroupFoodAndInsertData() async {
    String urlUpload = '${MyConstant().domain}/mlao/saveGroupFood.php';

    Random random = Random();
    int i = random.nextInt(1000000);
    String nameFile = 'GroupFood$i.jpg';

    try {
      Map<String, dynamic> map = Map();
      map['file'] = await MultipartFile.fromFile(file.path, filename: nameFile);
      FormData formData = FormData.fromMap(map);

      await Dio().post(urlUpload, data: formData).then((value) async {
        String urlPathImage = '/mlao/GroupFood/$nameFile';
        print('urlPathImage = ${MyConstant().domain}$urlPathImage');

        SharedPreferences preferences = await SharedPreferences.getInstance();
        String idShop = preferences.getString('id');

        String urlInsertData =
            '${MyConstant().domain}/mlao/addGroupFood.php?isAdd=true&idShop=$idShop&NameGroup=$nameGroup&PathImage=$urlPathImage';
        await Dio().get(urlInsertData).then((value) => Navigator.pop(context));
      });
    } catch (e) {}
  }

  Widget nameGroupForm() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => nameGroup = value.trim(),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.fastfood),
            labelText: 'ຊື່ໝວດສິນຄ້າ',
            border: OutlineInputBorder(),
          ),
        ),
      );

  Row groupFoodImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.add_a_photo),
          onPressed: () => chooseImage(ImageSource.camera),
        ),
        Container(
          width: 250.0,
          height: 250.0,
          child: file == null
              ? Image.asset('images/foodmenu.png')
              : Image.file(file),
        ),
        IconButton(
          icon: Icon(Icons.add_photo_alternate),
          onPressed: () => chooseImage(ImageSource.gallery),
        ),
      ],
    );
  }

  Future<Null> chooseImage(ImageSource source) async {
    try {
      var object = await ImagePicker().getImage(
        source: source,
        maxWidth: 800.0,
        maxHeight: 800.0,
      );
      setState(() {
        file = File(object.path);
      });
    } catch (e) {}
  }

  Widget showTitleFood(String string) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          MyStyle().showTitleH2(string),
        ],
      ),
    );
  }
}
