import 'package:flutter/material.dart';
import 'package:tickety_app/src/fade_animation.dart';
import 'package:tickety_app/src/pages/auth/auth_layout.dart';
import 'package:tickety_app/src/services/auth.dart';

import '../../loading.dart';

class RegisterPage extends StatefulWidget {

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  bool _isLoading = false;
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController username = new TextEditingController();

  TextEditingController email = new TextEditingController();

  TextEditingController password = new TextEditingController();

  TextEditingController confirmPassword = new TextEditingController();


  @override
  Widget build(BuildContext context) {

    Function onSignup = () {
      setState(() {
        _isLoading = true;
      });
      if(password.text.compareTo(confirmPassword.text) != 0) {
        scaffoldKey.currentState.showSnackBar(AuthLayout.snackBar('Password fields must be denticals'));
      }
      Map data = {
        'username': username.text.trim(),
        'email': email.text.trim(),
        'password': password.text
      };
      AuthService.login(data).then((data) {
        setState(() {
          _isLoading = false;
        });
        if(data != false) {
          Navigator.pushNamedAndRemoveUntil(context, '/', (Route<dynamic> route) => false);
        }
        else 
          scaffoldKey.currentState.showSnackBar(AuthLayout.snackBar('Username or Email already exists'));
      });
    };

    return Scaffold(
      backgroundColor: Colors.teal[400],
      key: scaffoldKey,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 25),
          width: double.infinity,
          decoration: AuthLayout.gradient,
          child: _isLoading ? Loading.spin(Colors.teal[50]) : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                child: Center(
                  child: FadeAnimation(delay:1.5, child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Sign up",
                        style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Create a Tickety account",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      )
                    ],
                  ))
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                    )
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: ListView(
                      children: <Widget>[
                        SizedBox(height: 40),
                        FadeAnimation(delay:1.6, child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          decoration: AuthLayout.mainBox(),
                          child: Column(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(color: Colors.grey[200])
                                  )
                                ),
                                child: AuthLayout.textField('Username', username)
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(color: Colors.grey[200])
                                  )
                                ),
                                child: AuthLayout.textField('Email', email)
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(color: Colors.grey[200])
                                  )
                                ),
                                child: AuthLayout.textField('Password', password)
                              ),
                              Container(
                                child: AuthLayout.textField('Confirm Password', confirmPassword)
                              ),
                            ],
                          ),
                        )),
                        SizedBox(height: 40),
                        FadeAnimation(delay:1.7, child: AuthLayout.actionButton('Continue', onSignup)),
                        SizedBox(height: 20),
                        FadeAnimation(delay:1.8, child: FlatButton(
                          onPressed: (){
                            Navigator.pushNamed(context, '/login');
                          },
                          child: Text("Login", style: TextStyle(color:  Colors.teal[300], fontSize: 15, fontWeight: FontWeight.w500)),
                        )),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}