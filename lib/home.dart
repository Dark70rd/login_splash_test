import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:login_splash_test/login.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var scrSize, scrHeight, scrWidth;

  bool isLoggedIn = false;

  late String username;
  late SharedPreferences prefs;
  void sharedPreferenceInit() async {
    prefs = await SharedPreferences.getInstance();
    isLoggedIn = prefs.getBool("isLoggedIn")!;
    username = prefs.getString("username")!;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    sharedPreferenceInit();
  }

  _performLogout() {
    prefs.remove("username");
    prefs.setBool("isLoggedIn", false);
    sharedPreferenceInit();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    scrSize = MediaQuery.of(context).size;
    scrHeight = scrSize.height;
    scrWidth = scrSize.width;
    return Container(
      height: scrHeight,
      width: scrWidth,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            const Image(
              image: AssetImage('assets/bgImages/cyan-girl0.jpg'),
              fit: BoxFit.fill,
              color: Color.fromARGB(210, 0, 0, 0),
              colorBlendMode: BlendMode.darken,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    (isLoggedIn == true)
                        ? 'You are logged in as: $username'
                        : 'You are Logged Out',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: scrHeight * 0.02,
                  ),
                  Text(
                    "Screen Height: $scrHeight \nScreen Width: $scrWidth \n",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 3, 107, 107),
          splashColor: Colors.teal,
          shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          onPressed: () {
            if (isLoggedIn == true) {
              _performLogout();
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            }
          },
          tooltip: 'Increment',
          child: Icon(
            (isLoggedIn == true) ? Icons.logout : Icons.login,
            size: 30.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
