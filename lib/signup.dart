import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login_splash_test/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:login_splash_test/home.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State createState() => SignupPageState();
}

class SignupPageState extends State<SignupPage>
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
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 150),
                        child: Text(
                          "Join E-corp",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: "Full name",
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
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: "Email, or phone",
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
                        height: 5.0,
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: usernamec,
                        decoration: InputDecoration(
                          labelText: "Username",
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
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(
                        height: 5.0,
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
                        obscureText: false,
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: "Enter password again!",
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
                        padding: const EdgeInsets.only(top: 20.0),
                      ),
                      MaterialButton(
                        height: 45.0,
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
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                            children: <TextSpan>[
                              TextSpan(text: "Already have an account? "),
                              TextSpan(
                                text: "Log In",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 3, 107, 107)),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()),
                                    );
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
