// import 'dart:convert';
// // import 'dart:js_util';

// import 'package:dio/dio.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:mlao/model/user_model.dart';
// // import 'package:mlao/screens/shop.dart';
// import 'package:mlao/shop/show_shop_food_menu.dart';
// import 'package:mlao/user/list.dart';
// import 'package:mlao/utility/signout_process.dart';
// // import 'package:mlao/user/list.dart';
// import 'package:mlao/user/listMenu.dart';
// // import 'package:mlao/widget/show_list_shop_all.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:mlao/screens/main_rider.dart';
// import 'package:mlao/screens/main_shop.dart';
// import 'package:mlao/screens/main_user.dart';
// import 'package:mlao/screens/signIn.dart';
// import 'package:mlao/screens/signup.dart';
// import 'package:mlao/utility/my_constant.dart';
// import 'package:mlao/utility/my_style.dart';
// import 'package:mlao/utility/normal_dialog.dart';

// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   String nameUser;
//   // Widget currentWidget;
//   // ignore: deprecated_member_use
//   List<UserModel> userModels = List();
//   // ignore: deprecated_member_use
//   List<Widget> shopCards = List();

//   // Widget currentWidget;

//   @override
//   void initState() {
//     super.initState();
//     // currentWidget = ShowListShopAll();
//     // findUser();
//     checkPreferance();
//     readShop();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('mlao food online'),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.exit_to_app),
//             onPressed: () => signOutProcess(context),
//           )
//         ],
//       ),
//       drawer: showDrawer(),
//       body: shopCards.length == 0
//           ? MyStyle().showProgress()
//           : GridView.extent(
//               maxCrossAxisExtent: 220.0,
//               mainAxisSpacing: 10.0,
//               crossAxisSpacing: 10.0,
//               children: shopCards,
//             ),
//     );
//   }

//   Drawer showDrawer() => Drawer(
//         child: ListView(
//           children: <Widget>[
//             showHeadDrawer(),
//             signInMenu(),
//             signUpMenu(),
//             listMenu(),
//             listww(),
//           ],
//         ),
//       );

//   ListTile signInMenu() {
//     return ListTile(
//       leading: Icon(Icons.login),
//       title: Text('ເຂົ້າສູ່ລະບົບ'),
//       onTap: () {
//         Navigator.pop(context);
//         MaterialPageRoute route =
//             MaterialPageRoute(builder: (value) => SignIn());
//         Navigator.push(context, route);
//       },
//     );
//   }

//   // ListTile listww() {
//   //   return ListTile(
//   //     leading: Icon(Icons.menu),
//   //     title: Text('ເມນູ1'),
//   //     onTap: () {
//   //       Navigator.pop(context);
//   //       MaterialPageRoute route =
//   //           MaterialPageRoute(builder: (value) => ShopScreen());
//   //       Navigator.push(context, route);
//   //     },
//   //   );
//   // }
//   ListTile listww() {
//     return ListTile(
//       leading: Icon(Icons.menu),
//       title: Text('ເມນູ1'),
//       onTap: () {
//         Navigator.pop(context);
//         MaterialPageRoute route =
//             MaterialPageRoute(builder: (value) => ListProduct());
//         Navigator.push(context, route);
//       },
//     );
//   }

//   ListTile listMenu() {
//     return ListTile(
//       leading: Icon(Icons.menu),
//       title: Text('ເມນູ'),
//       onTap: () {
//         Navigator.pop(context);
//         MaterialPageRoute route =
//             MaterialPageRoute(builder: (value) => ListMenu());
//         Navigator.push(context, route);
//       },
//     );
//   }

//   ListTile signUpMenu() {
//     return ListTile(
//       leading: Icon(Icons.how_to_reg),
//       title: Text('ລົງທະບຽນ'),
//       onTap: () {
//         Navigator.pop(context);
//         MaterialPageRoute route =
//             MaterialPageRoute(builder: (value) => SignUp());
//         Navigator.push(context, route);
//       },
//     );
//   }

//   Future<Null> readShop() async {
//     String url =
//         '${MyConstant().domain}/mlao/getUserWhereChooseType.php?isAdd=true&ChooseType=Shop';
//     await Dio().get(url).then((value) {
//       // print('value = $value');
//       var result = json.decode(value.data);
//       int index = 0;
//       for (var map in result) {
//         UserModel model = UserModel.fromJson(map);

//         String nameShop = model.nameShop;
//         if (nameShop.isNotEmpty) {
//           print('NameShop = ${model.nameShop}');
//           setState(() {
//             userModels.add(model);
//             shopCards.add(createCard(model, index));
//             index++;
//           });
//         }
//       }
//     });
//   }

//   Future<Null> findUser() async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     setState(() {
//       nameUser = preferences.getString('Name');
//     });
//   }

//   UserAccountsDrawerHeader showHeadDrawer() {
//     return UserAccountsDrawerHeader(
//       decoration: MyStyle().myBoxDecoration('guest.jpg'),
//       currentAccountPicture: MyStyle().showLogo(),
//       accountName: Text('Guest'),
//       accountEmail: Text('Please Login'),
//     );
//   }

//   Widget createCard(UserModel userModel, int index) {
//     return GestureDetector(
//       onTap: () {
//         print('You Click index $index');
//         MaterialPageRoute route = MaterialPageRoute(
//           builder: (context) => ShowShopFoodMenu(
//             userModel: userModels[index],
//           ),
//         );
//         Navigator.push(context, route);
//       },
//       child: Card(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Container(
//               width: 90.0,
//               height: 100.0,
//               child: Image.network(
//                 '${MyConstant().domain}${userModel.urlPicture}',
//                 fit: BoxFit.scaleDown,
//               ),
//             ),
//             MyStyle().mySizebox(),
//             Center(
//               child: Container(
//                 width: 120,
//                 child: MyStyle().showTitleH3(userModel.nameShop),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<Null> checkPreferance() async {
//     try {
//       FirebaseMessaging firebaseMessaging = FirebaseMessaging();
//       String token = await firebaseMessaging.getToken();
//       print('token ====>>> $token');

//       SharedPreferences preferences = await SharedPreferences.getInstance();
//       String chooseType = preferences.getString('ChooseType');
//       String idLogin = preferences.getString('id');
//       print('idLogin = $idLogin');

//       if (idLogin != null && idLogin.isNotEmpty) {
//         String url =
//             '${MyConstant().domain}/mlao/editTokenWhereId.php?isAdd=true&id=$idLogin&Token=$token';
//         await Dio()
//             .get(url)
//             .then((value) => print('###### Update Token Success #####'));
//       }

//       if (chooseType != null && chooseType.isNotEmpty) {
//         if (chooseType == 'ຜູ້ໃຊ້') {
//           routeToService(MainUser());
//         } else if (chooseType == 'ຮ້ານຄ້າ') {
//           routeToService(MainShop());
//         } else if (chooseType == 'ຜູ້ສົງອາຫານ') {
//           routeToService(MainRider());
//         } else {
//           normalDialog(context, 'Error User Type');
//         }
//       }
//     } catch (e) {}
//   }

//   void routeToService(Widget myWidget) {
//     MaterialPageRoute route = MaterialPageRoute(
//       builder: (context) => myWidget,
//     );
//     Navigator.pushAndRemoveUntil(context, route, (route) => false);
//   }
// }
