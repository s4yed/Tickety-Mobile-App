import 'package:flutter/material.dart';

class AuthLayout {
  
  static BoxDecoration gradient = BoxDecoration(
    gradient: LinearGradient(  
      begin: Alignment.topCenter,
      colors: [
        Colors.teal[400],
        Colors.teal[300],
        Colors.teal[200]
    ])
  );

  static SnackBar snackBar(String text) {
    return SnackBar(
      content: Text(text),
      backgroundColor: Colors.red[400],
    );
  } 

  static TextFormField textField(String label, TextEditingController textCtr) {
    return TextFormField(
      style: TextStyle(fontSize: 18),
      obscureText: label.contains('Password'),
      controller: textCtr,
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.grey),
        border: InputBorder.none,
        labelText: label
      ),
    );
  }

  static BoxDecoration mainBox() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.teal[50],
          blurRadius: 15,
          offset: Offset(0, 10)
        )
      ]
    );
  }

  static Container actionButton(String text, Function onClick) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.teal[300]
      ),
      child: FlatButton(
        onPressed: onClick,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)
        ),
        child: Center(
          child: Text('$text', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
        ),
      )
    );
  }
}