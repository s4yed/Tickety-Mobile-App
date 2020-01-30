import 'package:tickety_app/src/pages/tickets/cards/train_card.dart';
import 'package:tickety_app/src/services/user.dart';
import 'package:flutter/material.dart';

import '../../loading.dart';

class UserTicketPage extends StatefulWidget {
  @override
  _UserTicketPageState createState() => _UserTicketPageState();
}

class _UserTicketPageState extends State<UserTicketPage> {
  _UserTicketPageState();

  dynamic tickets;
  bool _isLoading = true;
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  final Function snackBar = (text, status) {
    return SnackBar(
      content: Text(text),
      duration: Duration(milliseconds: 500),
      backgroundColor: status ? Colors.green[400] : Colors.red[400],
    );
  };

  void getData() async {
    UserService.getUserData().then((data) {
      if(data != false) {
        setState(() {
          tickets = data['tickets'];
          _isLoading = false;
        });
      }
    });
  }
  void removeTrain(id) {
    UserService.removeTicket({'ticket_id': id}).then((data) {
      if(data != false) {
        setState(() {
          tickets.removeWhere((val) => val['_id'] == id);
        });
        _scaffoldKey.currentState.showSnackBar(snackBar('Ticket deleted successfully', true));
      }else {
        _scaffoldKey.currentState.showSnackBar(snackBar('Something is wrong', false));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('My Tickets'),
      ),
      body: _isLoading ? Loading.spin(Colors.teal[400]) : Container(
        child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          itemCount: tickets.length,
          itemBuilder: (context, index){
            final ticket = tickets[index];    
            return TrainCard(ticket: ticket, ticketStatus: removeTrain, add: false,);
          },
        ),
      )
    );
  }
}