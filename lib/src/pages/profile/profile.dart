import 'package:tickety_app/src/services/constants.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final data;
  ProfilePage({this.data});

  @override
  _ProfilePageState createState() => _ProfilePageState(data: data);
}

class _ProfilePageState extends State<ProfilePage> {
  final data;
  _ProfilePageState({this.data});

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    final TextStyle labelStyle = TextStyle(fontSize: 18,color: Colors.grey,);
    final TextStyle txtStyle = TextStyle(fontSize: 22,color: Colors.teal[300],fontWeight: FontWeight.bold);

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage(Constants.images + '/' + data['photo'][0]['filename']),
                radius: 50,
              ),
            ),
            Divider(height: 60, color: Colors.grey),
            Text('NAME',style: labelStyle,),
            SizedBox(height: 10,),
            Text(data['fullName'], style: txtStyle),
            SizedBox(height: 30,),
            Text('EMAIL',style: labelStyle),
            SizedBox(height: 10,),
            Text(data['email'], style: txtStyle),
            SizedBox(height: 30,),
            Text('USERNAME',style: labelStyle),
            SizedBox(height: 10,),
            Text(data['username'], style: txtStyle),
            SizedBox(height: 30,),
            Text('PHONE',style: labelStyle),
            SizedBox(height: 10,),
            Text(data['phone'], style: txtStyle),
            SizedBox(height: 30,),
          ],
        ),
      )
    );
  }
}