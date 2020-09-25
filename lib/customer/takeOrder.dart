import 'package:easyprint/customer/orderConfirm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'attachFile.dart';
import 'dart:math';

String shop_name;

class MyTakeOrder extends StatelessWidget {
 // String shop_name;
  MyTakeOrder(String name){
    shop_name=name;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TakeOrderHome(),
    );
  }
}

class TakeOrderHome extends StatefulWidget {
  @override
  _TakeOrderHomeState createState() => _TakeOrderHomeState();
}

class _TakeOrderHomeState extends State<TakeOrderHome> {
  int no_of_pages=0;
  int amount = 0;
  bool color_print = false;
  bool spiral = false;
  bool bw_print = false;
  int number;
  String date;
  String temp;
  //String shop_name;
  DateTime _date = new DateTime.now();
  TimeOfDay _time = new TimeOfDay.now();
  Random random = new Random();

  final _firestore= Firestore.instance;
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try{
      final user=await _auth.currentUser();
      if(user!=null)
        {
          loggedInUser=user;
          temp=loggedInUser.email;
        }
    }catch(e){
      print(e);
    }
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: new DateTime(2020),
        lastDate: new DateTime(2021));
    if (picked != null && picked != _date) {
      setState(() {
        _date = picked;
      });
    }
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: _time);
    if (picked != null && picked != _time) {
      setState(() {
        _time = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Make order'),
      ),
      resizeToAvoidBottomPadding: false,
      body: Form(
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 2.0, spreadRadius: 1.0, color: Colors.grey)
                        ]
                    ),
                    height: 100.0,
                    child: FlatButton(
                      child: Text(
                        'Click here to see price',

                        style: TextStyle(fontSize: 18.0, color: Colors.black45),
                      ),
                      padding: EdgeInsets.all(0),
                      onPressed: () {
                        String subname;
                        subname =
                            'Black and white   Rs.2\nColor Print            Rs.09\nSpiral Binding      Rs.30';
                        showAlertDialog(context, 'Prices', subname);
                      },
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Container(

                    height: 400.0,
                    child: FilePickerDemo(),
                  ),
                  SizedBox(height: 15.0),
                  Container(
                      // margin: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 2.0, spreadRadius: 1.0, color: Colors.grey)
                          ]
                      ),
                      height: 100.0,
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: TextField(
                          //autofocus: true,
                          decoration: InputDecoration(
                              labelText: 'Enter number of pages',
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),

                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black54))),
                          onChanged: (value) {
                            setState(() {
                              no_of_pages = int.parse(value);
                            });
                          },
                        ),
                      )),
                  SizedBox(height: 15.0),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 2.0, spreadRadius: 1.0, color: Colors.grey)
                        ]
                    ),
                    height: 200.0,
                    child: ListView(
                      children: <Widget>[
                        ListTile(
                          title: Text('Black and White Print'),
                          trailing: Checkbox(
                            activeColor: Colors.lightBlueAccent,
                            value: bw_print,
                            onChanged: (newValue) {
                              setState(() {
                                bw_print = newValue;
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: Text('Colour Print'),
                          trailing: Checkbox(
                            activeColor: Colors.lightBlueAccent,
                            value: color_print,
                            onChanged: (newValue) {
                              setState(() {
                                color_print = newValue;
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: Text('Spiral Binding'),
                          trailing: Checkbox(
                            activeColor: Colors.lightBlueAccent,
                            value: spiral,
                            onChanged: (newValue) {
                              setState(() {
                                spiral = newValue;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 2.0, spreadRadius: 1.0, color: Colors.grey)
                        ]
                    ),
                    height: 200.0,
                    child: buildCalender(),
                  ),
                  SizedBox(height: 15.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 2.0, spreadRadius: 1.0, color: Colors.grey)
                        ]
                    ),
                    height: 100.0,
                    child: calculateAmount(context),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 2.0, spreadRadius: 1.0, color: Colors.grey)
                        ]
                    ),
                    height: 100.0,
                    child: Center(
                      child: GestureDetector(
                        child: Text('Tap here to confirm order'),
                        onTap: () {
                          setState(() {
                            number=random.nextInt(30000);
                            DateTime _date2 = new DateTime.now();
                            date=_date2.toString();
                            _firestore.collection('customers').add({
                               'cost':amount,
                              'date_of_order':date,
                              'order_number':number,
                               'sender':loggedInUser.email,
                              'shopname':shop_name,
                            });

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OrderConfirmation(number)),
                            );
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildCalender() {
    return Container(
      child: new Column(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          new RaisedButton(
              child: Text('Select Date'),
              onPressed: () {
                _selectDate(context);
              }),
          Text('selected Date: $_date'),
          SizedBox(
            height: 10.0,
          ),
          new RaisedButton(
              child: Text('Select Time'),
              onPressed: () {
                _selectTime(context);
              }),
          Text('selected Time: $_time')
        ],
      ),
    );
  }

  Container calculateAmount(BuildContext context) {
    return Container(
      child: Center(
          child: GestureDetector(
              child: Text('Tap to see amount'),
              onTap: () {
                setState(() {
                  if (bw_print == true) {
                    amount = amount + no_of_pages * 2;
                  }
                  if (color_print == true) amount = amount + no_of_pages * 9;
                  if (spiral == true) amount = amount + 30;
                });
                showAlertDialog(context, 'Amount', 'The amount is $amount');
              })),
    );
  }

  showAlertDialog(BuildContext context, String name, String subname) {
    // Create button

    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        // Navigator.of(context).pop();
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(name),
      content: Text(subname),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
