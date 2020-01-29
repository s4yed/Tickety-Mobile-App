import 'package:tickety_app/src/services/auth.dart';
import 'package:tickety_app/src/services/constants.dart';
import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  final dynamic data;
  final dynamic tickets;
  SideBar({this.data, this.tickets});

  final TextStyle style = TextStyle(color: Colors.teal[300], fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(data['fullName'], style: TextStyle(fontSize: 15)),
            accountEmail: Text(data['email'], style: TextStyle(fontSize: 15)),
            currentAccountPicture: CircleAvatar(
              // backgroundColor: Colors.amber,
              // child: Text(data['fullName'][0]),
              backgroundImage: NetworkImage(Constants.images + '/' + data['photo'][0]['filename']),
            ),
          ),
          ListTile(
            title: Text('Account', style: style),
            leading: Icon(Icons.person, color: Colors.teal[300]),
            onTap: () {
              Navigator.popAndPushNamed(context, '/profile', arguments: data);
            },
          ),
          ListTile(
            title: Text('My Tickets', style: style),
            leading: Icon(Icons.style, color: Colors.teal[300]),
            onTap: () {
              Navigator.popAndPushNamed(context, '/myTickets', arguments: data['tickets']);
            },
          ),
          ListTile(
            title: Text('Add Tickets', style: style),
            leading: Icon(Icons.library_add, color: Colors.teal[300]),
          ),
          Divider(),
          ListTile(
            title: Text('Logout', style: style),
            leading: Icon(Icons.exit_to_app, color: Colors.teal[300]),
            onTap: (){
              AuthService.logout(context);
            },
          ),
        ],
    ),
    );
  }
}