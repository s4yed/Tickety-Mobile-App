import 'package:flutter/material.dart';
import 'package:tickety_app/src/fade_animation.dart';

class TrainCard extends StatelessWidget {
  final ticket;
  final bool add;
  final Function ticketStatus;
  final snackBar;
  TrainCard({this.ticket, this.ticketStatus, this.snackBar, this.add});


  @override
  Widget build(BuildContext context) {
    final String from = ticket['from'], to = ticket['to'];
    final String date = ticket['date_time'].toString().split(' ').sublist(0,3).join(' ');
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: FadeAnimation(delay:1.5, child: Card(
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 4),
                child: Row(children: <Widget>[
                  Text("$from - $to", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.teal[300]),),
                  Spacer(),
                  Icon(ticket['category'] == 'TRAIN'? Icons.train : Icons.directions_bus, color: Colors.teal[300],)
                ],),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 50),
                child: Row(children: <Widget>[
                  Text(date, style: TextStyle(fontSize: 15, color: Colors.teal[300]),)
                ],),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(children: <Widget>[
                  Text("EGP ${ticket['price'].toString()}.00", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal[300])),
                  Spacer(),
                  FlatButton(
                    onPressed: (){
                      ticketStatus(ticket['_id']);
                    },
                    color: add ? Colors.teal[300] : null,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: add ? Text('Add', style: TextStyle(color: Colors.grey[100],fontSize: 16),) : Icon(Icons.delete, color: Colors.red[300],)
                  )
                ],),
              )
            ],
          ),
        ),
      ))
    );
  }
}