import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mlao/utility/my_constant.dart';
import 'package:mlao/utility/my_style.dart';
import 'package:mlao/utility/normal_dialog.dart';
// import 'package:greenmarket/utility/my_constant.dart';
// //import 'package:greenmarket/utility/my_constant.dart';
// import 'package:greenmarket/utility/my_styte.dart';
// import 'package:greenmarket/utility/normal_dialog.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String chooseType, name, user, password, address, phone;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('ລົງທະບຽນ',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
            )),
      ),
      body: Container(
        // decoration: BoxDecoration(
        //   gradient: RadialGradient(
        //     colors: <Color>[Colors.white, MyStyle().primaryColor],
        //     center: Alignment(0, -0.3),
        //     radius: 1.0,
        //   ),
        // ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                myLogo(),
                MyStyle().mySizebox(),
                ShowAppName(),
                MyStyle().mySizebox(),
                nameForm(),
                MyStyle().mySizebox(),
                userForm(),
                MyStyle().mySizebox(),
                passwordForm(),
                MyStyle().mySizebox(),
                MyStyle().showTitleH2('ຊ່ອງທາງການຕິດຕໍ່ :'),
                MyStyle().mySizebox(),
                addressForm(),
                MyStyle().mySizebox(),
                phoneForm(),
                MyStyle().mySizebox(),
                registerButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget registerButton() => Container(
        width: 250.0,
        child: ElevatedButton(
          // color: Mystyle().darkColor,
          onPressed: () {
            print(
                'name = $name,user = $user,password = $password,address = $address,phone = $phone,chooseType = User');

            if (name == null ||
                name.isEmpty ||
                user == null ||
                user.isEmpty ||
                password == null ||
                password.isEmpty ||
                address == null ||
                address.isEmpty ||
                phone == null ||
                phone.isEmpty) {
              print('Have Space');
              normalDialog(context, 'ມີ່ຊ່ອງວ່າງ ກະລຸນາໃສຂໍ້ມູນໃຫ້ຄົບ');
            } else {
              checkUser();
            }
          },
          child: Text(
            'ສະໝັກ',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );

  Future<Null> checkUser() async {
    String url =
        '${MyConstant().domain}/mlao/getUserWhereUser.php?isAdd=true&User=$user';

    print('url ===>>> $url');
    try {
      Response response = await Dio().get(url);
      print('res ######==>>> $response');
      // normalDialog(
      //     context, 'ສະໝັກໄດ້ແລ້ວ ກະລຸນາກັບໄປຫນ້າທຳອິດແລ້ວເຂົ້າສູ່ລະບົບ');
      if (response.toString() == 'null') {
        registerThread();
      } else {
        normalDialog(
            context, 'ຜູ້ໃຊ້ນີ້ $user ມີຄົນອື່ນໃຊ້ແລ້ວ ກະລຸນາປ່ຽນຜູ້ໃຊ້ໄໝ່');
      }
    } catch (e) {}
  }

  Future<Null> registerThread() async {
    String url =
        '${MyConstant().domain}/mlao/addUserCust.php?isAdd=true&Name=$name&User=$user&Password=$password&Address=$address&Phone=$phone&ChooseType=User';

    print('###### url register ==>> $url');

    try {
      Response response = await Dio().get(url);
      print('res = $response');
      if (response.toString() == 'true') {
        Navigator.pop(context);
        normalDialog(context,
            'ຜູ້ໃຊ້ນີ້ $user ສະໝັກໄດ້ແລ້ວ ກະລຸນາໃສ່ຂໍ້ມູນທີສະໝັກເພຶ່ອເຂົ້າສູ່ລະບົບ');
      } else {
        normalDialog(context, 'ບໍ່ສາມາດສະໝັກໄດ້ ກະລຸນາລອງໄໝ່');
      }
    } catch (e) {
      print(e);
    }
  }

  Widget nameForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 250.0,
            child: TextField(
              onChanged: (value) => name = value.trim(),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.person,
                  color: MyStyle().darkColor,
                ),
                labelStyle: TextStyle(color: MyStyle().darkColor),
                labelText: 'ຊື່ :',
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyStyle().darkColor)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyStyle().primaryColor)),
              ),
            ),
          ),
        ],
      );

  Widget userForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 250.0,
            child: TextField(
              onChanged: (value) => user = value.trim(),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.account_box,
                  color: MyStyle().darkColor,
                ),
                labelStyle: TextStyle(color: MyStyle().darkColor),
                labelText: 'ຜູ້ໃຊ້ :',
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyStyle().darkColor)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyStyle().primaryColor)),
              ),
            ),
          ),
        ],
      );

  Widget passwordForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 250.0,
            child: TextField(
              onChanged: (value) => password = value.trim(),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.lock,
                  color: MyStyle().darkColor,
                ),
                labelStyle: TextStyle(color: MyStyle().darkColor),
                labelText: 'ລະຫັດຜ່ານ :',
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyStyle().darkColor)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyStyle().primaryColor)),
              ),
            ),
          ),
        ],
      );

  Widget addressForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 250.0,
            child: TextField(
              onChanged: (value) => address = value.trim(),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.home,
                  color: MyStyle().darkColor,
                ),
                labelStyle: TextStyle(color: MyStyle().darkColor),
                labelText: 'ບ່ອນຢູ່ :',
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyStyle().darkColor)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyStyle().primaryColor)),
              ),
            ),
          ),
        ],
      );

  Widget phoneForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 250.0,
            child: TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) => phone = value.trim(),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.call,
                  color: MyStyle().darkColor,
                ),
                labelStyle: TextStyle(color: MyStyle().darkColor),
                labelText: 'ເບີ້ຕິດຕໍ່ :',
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyStyle().darkColor)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyStyle().primaryColor)),
              ),
            ),
          ),
        ],
      );
  Widget buyRadio() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            width: 250.0,
            child: Row(
              children: <Widget>[
                Radio(
                  value: 'User',
                  groupValue: chooseType,
                  onChanged: (value) {
                    setState(() {
                      chooseType = value;
                    });
                  },
                ),
                Text(
                  'ລູກຄ້າ',
                  style: TextStyle(color: MyStyle().darkColor),
                )
              ],
            ),
          ),
        ],
      );

  Widget myLogo() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MyStyle().showLogo(),
        ],
      );
}

class ShowAppName extends StatelessWidget {
  const ShowAppName({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        MyStyle().showTitle(' Mueanglaofood '),
      ],
    );
  }
}
