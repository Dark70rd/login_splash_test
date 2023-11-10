// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:login_splash_test/home.dart';
import 'package:login_splash_test/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool("isLoggedIn") ?? false;

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(
            MaterialApp(
              home: isLoggedIn ? HomePage() : LoginPage(),
            ),
          ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  var scrSize, scrHeight, scrWidth;

  @override
  Widget build(BuildContext context) {
    scrSize = MediaQuery.of(context).size;
    scrHeight = scrSize.height;
    scrWidth = scrSize.width;

    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.tealAccent),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}
