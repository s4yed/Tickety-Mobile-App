import 'package:tickety_app/src/loading.dart';
import 'package:flutter/material.dart';
import 'package:tickety_app/src/pages/auth/auth_layout.dart';
import 'package:tickety_app/src/services/auth.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool _isLoading = false;
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController email = new TextEditingController();

  TextEditingController password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Function onLogin = () {
      setState(() {
        _isLoading = true;
      });
      Map data = {
        'username': email.text.trim(),
        'password': password.text
      };
      AuthService.login(data).then((data) {
        setState(() {
          _isLoading = false;
        });
        if(data) {
          Navigator.pushNamedAndRemoveUntil(context, '/', (Route<dynamic> route) => false);
        } else {
          scaffoldKey.currentState.showSnackBar(AuthLayout.snackBar('Invalid Username or Password'));
        }
      });
    };

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.teal[400],
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 25),
          width: double.infinity,
          decoration: AuthLayout.gradient,
          child: _isLoading ? Loading.spin(Colors.teal[50]) : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Using your Tickety account",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      )
                    ],
                  )
                ),
              ),
              SizedBox(height: 40),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60)
                    )
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: ListView(
                      primary: true,
                      children: <Widget>[
                        SizedBox(height: 40),
                        Container(
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
                                child: AuthLayout.textField("Email or Username", email)
                              ),
                              Container(
                                child: AuthLayout.textField('Password', password)
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 40),
                        Center(child: Text('Forgot Password?', style: TextStyle(color: Colors.grey))),
                        SizedBox(height: 40),
                        AuthLayout.actionButton('Login', onLogin),
                        SizedBox(height: 40),
                        FlatButton(
                          onPressed: (){
                            Navigator.pushNamed(context, '/register');
                          },
                          child: Text('Create an account', style: TextStyle(color: Colors.teal[300], fontSize: 15, fontWeight: FontWeight.w500)),
                        ),
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