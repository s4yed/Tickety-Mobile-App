import 'package:tickety_app/src/loading.dart';
import 'package:tickety_app/src/pages/home/sidebar.dart';
import 'package:tickety_app/src/pages/tickets/cards/train_card.dart';
import 'package:tickety_app/src/services/auth.dart';
import 'package:tickety_app/src/services/ticket.dart';
import 'package:tickety_app/src/services/user.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  dynamic userData, tickets = [], userTickets = [];
  bool _isLoading = true;
  String fstLetter;
  String name;
  String email;
  final Function snackBar = (text, status) {
    return SnackBar(
      content: Text(text),
      duration: Duration(milliseconds: 500),
      backgroundColor: status ? Colors.green[400] : Colors.red[400],
    );
  };
  void getData() async {
    dynamic data = await Future.wait([
      UserService.getUserData(),
      TicketService.getTrainTickets(),
      // TicketService.getBusTickets(),
    ]);
    if(data[0] != false && data[1] != false) {
      setState(() {
        tickets = data[1];
        userData = data[0];
        fstLetter = userData != null ? userData['fullName'].toString()[0].toUpperCase() : '';
        name = userData['fullName'].toString();
        email = userData != null ? userData['email'] : '';
        _isLoading = false;
      });
    }
  }

  void addTrain(id) {
    UserService.addTicket({'ticket_id': id}).then((data) {
      if(data != false) {
        _scaffoldKey.currentState.showSnackBar(snackBar('Ticket added successfully', true));
      }else {
        _scaffoldKey.currentState.showSnackBar(snackBar('Something is wrong', false));
      }
    });
  }

  void isAuthed() async {
    final auth = await AuthService.isAuthenticated();
    if(!auth) {
      Navigator.pushNamedAndRemoveUntil(context, '/login', (Route<dynamic> route) => false);
    }
  }

  @override
  void initState() {
    super.initState();
    isAuthed();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Home')
      ),
      drawer: Drawer(
        elevation: 0,
        child: SideBar(data: userData, tickets: userTickets)
      ),
      body: _isLoading ? Loading.spin(Colors.teal[400]) : Container(
        child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          itemCount: tickets.length,
          itemBuilder: (context, index){
            final ticket = tickets[index];    
            return TrainCard(ticket: ticket, ticketStatus: addTrain, add: true,);
          },
        ),
      )
    );
  }
}