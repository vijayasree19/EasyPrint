import 'package:flutter/material.dart';
import 'package:easyprint/main.dart';
import 'package:flutter/widgets.dart';
import 'package:easyprint/customer/cushome.dart';
import 'package:easyprint/customer/cusorder.dart';
import 'package:easyprint/customer/cusprofile.dart';
import 'package:easyprint/customer/cussearch.dart';


class MycusPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,

      home: MyCustomer1Page(),
    );
  }
}

class MyCustomer1Page extends StatefulWidget {


  @override
  _MyCustomer1PageState createState() => _MyCustomer1PageState();
}

class _MyCustomer1PageState extends State<MyCustomer1Page> with SingleTickerProviderStateMixin {

  int _currentIndex=0;
  final List<Widget> _children = [
    Home(),
    MySearch(),
    MyOrder(),
    MyProfile()
  ];

  void onTappedBar(int index)
  {
    setState(() {
      _currentIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
       // backgroundColor: Colors.teal,

        body: _children[_currentIndex],


        bottomNavigationBar: BottomNavigationBar(
         // fixedColor: Colors.black,

          //backgroundColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          onTap: onTappedBar,
          currentIndex: _currentIndex,
          selectedItemColor: Colors.blueAccent,

          items:<BottomNavigationBarItem>
          [
            BottomNavigationBarItem
              (
                icon: Icon(Icons.home),
                title: Text("Home")
            ),
            BottomNavigationBarItem
              (
                icon: Icon(Icons.search),
                title: Text("Search")
            ),
            BottomNavigationBarItem
              (
                icon: Icon(Icons.shopping_cart),
                title: Text("Order history")
            ),
            BottomNavigationBarItem
              (
                icon: Icon(Icons.person),
                title: Text("Profile"),

            ),
          ],
        )

    );
        }



}