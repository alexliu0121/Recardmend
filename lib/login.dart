import 'package:flutter/material.dart';
import 'package:flutter_app/sign_in.dart';
import 'profile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  static bool _accountState = false, _passwordState = false;
  static TextEditingController _accountController = new TextEditingController();
  static TextEditingController _passwordController =
      new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Login"),
      // ),
      backgroundColor: Colors.lightBlue.shade900,
      body: SingleChildScrollView(
        child: Container(
            constraints: BoxConstraints.tightFor(width: 500.0, height: 850.0),
            margin: EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 0),
            decoration: BoxDecoration(
              color: Colors.lightBlue.shade900,
              image: DecorationImage(
                image: AssetImage('assets/進入頁面3.png'),
              ),
            ),
            child: Container(
              margin:
                  EdgeInsets.only(left: 60, top: 120, right: 60, bottom: 20),
              constraints: BoxConstraints(
                maxWidth: 200,
                maxHeight: 200,
                minWidth: 50,
                minHeight: 50,
              ),
              decoration: BoxDecoration(),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 470.0,
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      minimumSize: Size(double.infinity, 50),
                    ),
                    icon: FaIcon(FontAwesomeIcons.google, color: Colors.red),
                    label: Text('Sign up with Google'),
                    onPressed: () {
                      final provider = Provider.of<GoogleSignInProvider>(
                          context,
                          listen: false);
                      provider.googleLogin();
                    },
                  ),
                  SizedBox(
                    height: 52.0,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
