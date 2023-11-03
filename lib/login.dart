import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:login_splash_test/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  TextEditingController usernamec = TextEditingController();
  TextEditingController passwordc = TextEditingController();
  final formKey = GlobalKey<FormState>();

  _performLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("username", usernamec.text);
    prefs.setBool("isLoggedIn", true);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: AssetImage('assets/bgImages/donna1.jpg'),
            fit: BoxFit.cover,
            color: Color.fromARGB(194, 0, 0, 0),
            colorBlendMode: BlendMode.multiply,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ImageIcon(
                AssetImage('assets/icons/logo-nobg.png'),
                color: Colors.white,
                size: 120,
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: usernamec,
                        decoration: InputDecoration(
                          labelText: "Phone, email, or username",
                          labelStyle: TextStyle(color: Colors.grey),
                          floatingLabelStyle: TextStyle(color: Colors.white),
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 3, 107, 107),
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: passwordc,
                        decoration: InputDecoration(
                          labelText: "Enter Password",
                          labelStyle: TextStyle(color: Colors.grey),
                          floatingLabelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 3, 107, 107),
                            ),
                          ),
                        ),
                        obscureText: true,
                        keyboardType: TextInputType.text,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 32.0),
                      ),
                      MaterialButton(
                        height: 50.0,
                        minWidth: 150.0,
                        color: Color.fromARGB(255, 3, 107, 107),
                        splashColor: Colors.teal,
                        textColor: Colors.white,
                        child: Icon(FontAwesomeIcons.arrowRight),
                        onPressed: () {
                          _performLogin();
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: RichText(
                          text: TextSpan(
                              style: TextStyle(color: Colors.grey),
                              children: <TextSpan>[
                                TextSpan(
                                    text: "Forgot password?",
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        print("Forgot password tapped!");
                                      }),
                              ]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                            children: <TextSpan>[
                              TextSpan(text: "Don't have an account? "),
                              TextSpan(
                                text: "Sign up",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 3, 107, 107)),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    print("Sign up tapped!");
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
