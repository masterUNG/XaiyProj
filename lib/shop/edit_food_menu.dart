import 'dart:io';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mlao/model/food_model.dart';
import 'package:mlao/model/groupfood_model.dart';
// import 'package:mlao/model/groupfood_model.dart';
import 'package:mlao/utility/my_constant.dart';
import 'package:mlao/utility/my_style.dart';
import 'package:mlao/utility/normal_dialog.dart';

class EditFoodMenu extends StatefulWidget {
  final FoodModel foodModel;
  EditFoodMenu(
      {Key key,
      this.foodModel,
      FoodModel foodModels,
      GroupFoodModel groupFoodModel})
      : super(key: key);

  @override
  _EditFoodMenuState createState() => _EditFoodMenuState();
}

class _EditFoodMenuState extends State<EditFoodMenu> {
  FoodModel foodModel;
  File file;
  String nameFood, price, detail, pathImage, idGrp, status;

  @override
  void initState() {
    super.initState();
    foodModel = widget.foodModel;
    nameFood = foodModel.nameFood;
    price = foodModel.price;
    detail = foodModel.detail;
    idGrp = foodModel.idGrp;
    status = foodModel.status;
    pathImage = foodModel.pathImage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: uploadButton(),
      appBar: AppBar(
        title: Text('ແກ້ໄຂສິນຄ້າ ${foodModel.nameFood}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            nameFoods(),
            groupImage(),
            priceFood(),
            detailFood(),
            MyStyle().showTitleH2('ຊະນິດຂອງຜູ້ໃຊ້ງານ :'),
            MyStyle().mySizebox(),
            onRadio(),
            offRadio(),
            groupFood()
          ],
        ),
      ),
    );
  }

  FloatingActionButton uploadButton() {
    return FloatingActionButton(
      onPressed: () {
        if (nameFood.isEmpty ||
            price.isEmpty ||
            detail.isEmpty ||
            idGrp.isEmpty) {
          normalDialog(context, 'ກະລຸກາໃສ່ຂ້ມູນໃຫ້ຄົບ');
        } else {
          confirmEdit();
        }
      },
      child: Icon(Icons.cloud_upload),
    );
  }

  Future<Null> confirmEdit() async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text('ທ່ານຕ້ອງການຈະປ່ນແປງຂໍ້ມູນສິນຄ້ານີ້ແທ້ບໍ ?'),
        children: <Widget>[
          Row(
            children: <Widget>[
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                  editValueOnMySQL();
                },
                icon: Icon(
                  Icons.check,
                  color: Colors.green,
                ),
                label: Text('ຍອມຮັບ'),
              ),
              ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.clear,
                  color: Colors.red,
                ),
                label: Text('ປະຕິເສດ'),
              )
            ],
          )
        ],
      ),
    );
  }

  Future<Null> editValueOnMySQL() async {
    Random random = Random();
    int i = random.nextInt(100000);
    String nameFile = 'editFood$i.jpg';

    Map<String, dynamic> map = Map();
    map['file'] = await MultipartFile.fromFile(file.path, filename: nameFile);
    FormData formData = FormData.fromMap(map);
    String urlUpload = '${MyConstant().domain}/mlao/saveFood.php';
    await Dio().post(urlUpload, data: formData).then((value) async {
      pathImage = '/mlao/Food/$nameFile';
      String id = foodModel.id;
      // print('id = $id');
      String url =
          '${MyConstant().domain}/mlao/editFoodWhereId.php?isAdd=true&id=$id&NameFood=$nameFood&PathImage=$pathImage&Price=$price&Detail=$detail&idGrp=$idGrp&Status=$status';
      Response response = await Dio().get(url);
      if (response.toString() == 'true') {
        Navigator.pop(context);
      } else {
        normalDialog(context, 'ຍັງແກ້ໄຂບໍ່ໄດ້ ກະລຸນາແກ້ໄຂໄໝ່');
      }
    });
  }

  Widget groupImage() => Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.add_a_photo),
            onPressed: () => chooseImage(ImageSource.camera),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            width: 250.0,
            height: 250,
            child: file == null
                ? Image.network(
                    '${MyConstant().domain}${foodModel.pathImage}',
                    fit: BoxFit.cover,
                  )
                : Image.file(file),
          ),
          IconButton(
            icon: Icon(Icons.add_photo_alternate),
            onPressed: () => chooseImage(ImageSource.gallery),
          ),
        ],
      );

  Future<Null> chooseImage(ImageSource source) async {
    try {
      var object = await ImagePicker().getImage(
        source: source,
        maxWidth: 600.0,
        maxHeight: 600.0,
      );
      setState(() {
        file = File(object.path);
      });
    } catch (e) {}
  }

  Widget nameFoods() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 16.0),
            width: 250.0,
            child: TextFormField(
              onChanged: (value) => nameFood = value.trim(),
              initialValue: nameFood,
              decoration: InputDecoration(
                labelText: 'ຊື່ສິນຄ້າ',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      );

  Widget priceFood() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 16.0),
            width: 250.0,
            child: TextFormField(
              onChanged: (value) => price = value.trim(),
              keyboardType: TextInputType.number,
              initialValue: price,
              decoration: InputDecoration(
                labelText: 'ລາຄາ ສິນຄ້າ',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      );

  Widget detailFood() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 16.0),
            width: 250.0,
            child: TextFormField(
              onChanged: (value) => detail = value.trim(),
              keyboardType: TextInputType.multiline,
              initialValue: detail,
              decoration: InputDecoration(
                labelText: 'ຫົວໜ່ວຍ',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      );
  Widget groupFood() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 16.0),
            width: 250.0,
            child: TextFormField(
              onChanged: (value) => idGrp = value.trim(),
              keyboardType: TextInputType.multiline,
              initialValue: idGrp,
              decoration: InputDecoration(
                labelText: 'ໝວດສິນຄ້າ',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      );

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
                  ' ມີສິນຄ້າ',
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
                  'ສິນຄ້າໝົດຊົ່ວຄາວ',
                  style: TextStyle(color: MyStyle().darkColor),
                )
              ],
            ),
          ),
        ],
      );
}
