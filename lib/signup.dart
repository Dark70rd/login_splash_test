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
  var scrSize, scrHeight, scrWidth;
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
    scrSize = MediaQuery.of(context).size;
    scrHeight = scrSize.height;
    scrWidth = scrSize.width;
    return Container(
      height: scrHeight,
      width: scrWidth,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.black,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image(
              image: AssetImage('assets/bgImages/donna1.jpg'),
              fit: BoxFit.cover,
              color: Colors.black87,
              colorBlendMode: BlendMode.darken,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all((scrWidth * 0.03)),
                  child: Form(
                    autovalidateMode: AutovalidateMode.always,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: (scrWidth * 0.59)),
                          child: Text(
                            "Signup",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 9.4,
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
                          height: (scrHeight * 0.005),
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
                          height: (scrHeight * 0.005),
                        ),
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          controller: passwordc,
                          decoration: InputDecoration(
                            labelText: "Password",
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
                          height: (scrHeight * 0.005),
                        ),
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: "Confirm password",
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
                          padding: EdgeInsets.only(top: (scrHeight * 0.02)),
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
                          padding: EdgeInsets.only(top: (scrHeight * 0.01)),
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
      ),
    );
  }
}
