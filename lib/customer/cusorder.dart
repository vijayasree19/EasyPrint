import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firestore = Firestore.instance;
FirebaseUser loggedInUser;

class MyOrder extends StatefulWidget {
  @override
  _MyOrderState createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {

  final _auth = FirebaseAuth.instance;


  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Order History'),
        ),
        body: SafeArea(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
    StreamBuilder<QuerySnapshot>(
    stream: _firestore.collection('customers').snapshots(),
    // ignore: missing_return
    builder: (context,snapshot) {
    if(snapshot.hasData){
    final orders=snapshot.data.documents;
    List<ListOfOrders> orderWidgets=[];
    for(var order in orders){
    final ordershop=order.data['shopname'];
    final orderdate=order.data['date_of_order'];
    final ordernum=order.data['order_number'];
    final ordercost=order.data['cost'];
    //final orderWidget1=Text('$ordershop on $orderdate with $ordernum with cost $ordercost');


    final orderWidget = ListOfOrders(
                      name_of_shop: ordershop,
                      amount: ordercost.toString(),
                      date_of_order: orderdate,
                      order_num: ordernum,
                    );
    if(loggedInUser.email==order.data['sender'])
    {
    orderWidgets.add(orderWidget); }
    }
    return Column(
    children: orderWidgets,
    );
    }
    }
    )
    ],
    ),
    ),

    );
    }
  }

class ListOfOrders extends StatelessWidget {
  ListOfOrders({this.name_of_shop,this.order_num,this.date_of_order,this.amount});
  final name_of_shop;
   final amount;
  final order_num;
  final date_of_order;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
          Icons.shop
      ),
      title: Text('$name_of_shop'),
      subtitle: Text('$date_of_order'+'\n'+'order number is$order_num'+'\n'+'Amount is $amount'),
    );
  }
}

