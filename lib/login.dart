import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login_splash_test/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:login_splash_test/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage>
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

  late AnimationController _iconAnimationController;
  late Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
    _iconAnimation = CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.bounceOut,
    );
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
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
            Image(
              image: AssetImage('assets/bgImages/donna1.jpg'),
              fit: BoxFit.cover,
              color: Colors.black87,
              colorBlendMode: BlendMode.darken,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ImageIcon(
                  AssetImage('assets/icons/logo-nobg.png'),
                  color: Colors.white,
                  size: _iconAnimation.value * 120,
                ),
                Container(
                  padding: EdgeInsets.all((scrWidth * 0.03)),
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
                          height: 8.0,
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
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SignupPage(),
                                        ),
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
