import 'dart:io';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mlao/utility/my_constant.dart';
import 'package:mlao/utility/my_style.dart';
import 'package:mlao/utility/normal_dialog.dart';

class AddFoodMenu extends StatefulWidget {
  @override
  _AddFoodMenuState createState() => _AddFoodMenuState();
}

class _AddFoodMenuState extends State<AddFoodMenu> {
  File file;
  String nameFood, price, detail, idGrp, status;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ເພີ່ມລາຍການສິນຄ້າ'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            showTitleFood('ຮູບພາບສິນຄ່າ'),
            pathImage(),
            showTitleFood('ລາຍລະອຽດສິນຄ້າ'),
            nameForm(),
            MyStyle().mySizebox(),
            priceForm(),
            MyStyle().mySizebox(),
            detailForm(),
            MyStyle().mySizebox(),
            groupForm(),
            MyStyle().mySizebox(),
            //
            MyStyle().showTitleH2('ຊະນິດຂອງຜູ້ໃຊ້ງານ :'),
            MyStyle().mySizebox(),
            onRadio(),
            offRadio(),
            //
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
          } else if (nameFood == null ||
              nameFood.isEmpty ||
              price == null ||
              price.isEmpty ||
              detail == null ||
              detail.isEmpty ||
              idGrp == null ||
              idGrp.isEmpty) {
            normalDialog(context, 'ກະລຸນາໃສ່ຂໍ້ມູນໃຫ້ຄົບ');
          } else {
            uploadFoodAndInsertData();
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

  Future<Null> uploadFoodAndInsertData() async {
    String urlUpload = '${MyConstant().domain}/mlao/saveFood.php';

    Random random = Random();
    int i = random.nextInt(1000000);
    String nameFile = 'food$i.jpg';

    try {
      Map<String, dynamic> map = Map();
      map['file'] = await MultipartFile.fromFile(file.path, filename: nameFile);
      FormData formData = FormData.fromMap(map);

      await Dio().post(urlUpload, data: formData).then((value) async {
        String urlPathImage = '/mlao/Food/$nameFile';
        print('urlPathImage = ${MyConstant().domain}$urlPathImage');

        SharedPreferences preferences = await SharedPreferences.getInstance();
        String idShop = preferences.getString('id');

        String urlInsertData =
            '${MyConstant().domain}/mlao/addFood.php?isAdd=true&idShop=$idShop&NameFood=$nameFood&PathImage=$urlPathImage&Price=$price&Detail=$detail&idGrp=$idGrp&Status=$status';
        await Dio().get(urlInsertData).then((value) => Navigator.pop(context));
      });
    } catch (e) {}
  }

  Widget nameForm() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => nameFood = value.trim(),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.fastfood),
            labelText: 'ຊື່ສິນຄ້າ',
            border: OutlineInputBorder(),
          ),
        ),
      );

  Widget priceForm() => Container(
        width: 250.0,
        child: TextField(
          keyboardType: TextInputType.number,
          onChanged: (value) => price = value.trim(),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.attach_money),
            labelText: 'ລາຄາ',
            border: OutlineInputBorder(),
          ),
        ),
      );

  Widget detailForm() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => detail = value.trim(),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.merge_type),
            labelText: 'ຫົວໜ່ວຍ',
            border: OutlineInputBorder(),
          ),
        ),
      );
  Widget groupForm() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => idGrp = value.trim(),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.category),
            labelText: 'ໝວດ',
            border: OutlineInputBorder(),
          ),
        ),
      );

  Widget statusForm() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => status = value.trim(),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.star_outline_sharp),
            labelText: 'ສະຖານະ',
            border: OutlineInputBorder(),
          ),
        ),
      );

  Row pathImage() {
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
        maxWidth: 400.0,
        maxHeight: 400.0,
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

  Widget onRadio() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            width: 250.0,
            child: Row(
              children: <Widget>[
                Radio(
                  value: 'on',
                  groupValue: status,
                  onChanged: (value) {
                    setState(() {
                      status = value;
                    });
                  },
                ),
                Text(
                  'ສິນຄ້າໝົດຊົ່ວຄາວ',
                  style: TextStyle(color: MyStyle().darkColor),
                )
              ],
            ),
          ),
        ],
      );
  Widget offRadio() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            width: 250.0,
            child: Row(
              children: <Widget>[
                Radio(
                  value: 'off',
                  groupValue: status,
                  onChanged: (value) {
                    setState(() {
                      status = value;
                    });
                  },
                ),
                Text(
                  'ມີສິນຄ້າ',
                  style: TextStyle(color: MyStyle().darkColor),
                )
              ],
            ),
          ),
        ],
      );
}
