import 'package:app/home.dart';
import 'package:app/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'databasehelper.dart';
import 'models/User.dart';

void main() async {
  runApp(MyApp());
}

/* does sharedpref flutter support ios and android with same base code ?*/
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
              child: MyHomePage(
        title: "app",
      ))),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ThemeData.light()
              .colorScheme
              .copyWith(primary: Color.fromRGBO(0, 114, 255, 1))),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoggedIn = true;
  String uid = "";

  @override
  Widget build(BuildContext context) {
    SharedPreferences.getInstance().then((value) {
      isLoggedIn = value.getBool("isLoggedIn") ?? false;
      uid = value.getString("UID") ?? "";
      print(isLoggedIn);
      print(uid);
    });

    return Container(
      child: isLoggedIn ? Text("homepage") : LoginPage(),
    );
  }

  User getLoggedInUser() {
    Databasehelper db = new Databasehelper();
    User? u;

    db.listconnid(uid).then((value) => u = value);

    return u ?? User.init();
  }

  @override
  void initState() {
    super.initState();
  }
}
