import 'package:easyprint/customer/cussignup.dart';
import 'package:easyprint/shopkeeper/shopsignup.dart';
import 'package:flutter/material.dart';
import 'package:easyprint/main.dart';
import 'package:flutter/widgets.dart';

class MyChoice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,

      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      body: Column(

        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                  child: Text(
                    'Signup as',
                    style: TextStyle(
                        fontSize: 80.0, fontWeight: FontWeight.bold
                    ),
                  ),
                ),


              ],
            ),

          ),
          SizedBox(height: 40.0),
          Container(
            height: 40.0,
            child: Material(
              borderRadius: BorderRadius.circular(20.0),
              shadowColor: Colors.greenAccent,
              color: Colors.green,
              elevation: 7.0,
              child: GestureDetector(
                onTap: () {
                  //Navigator.of(context).pushNamed('/shopsignup');
                  //Navigator.pushNamed(context, '/shopsignup');
                 Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyShopDetails()),
                  );


                },
                child: Center(
                  child: Text(
                    'SHOPKEEPER',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            height: 40.0,
            child: Material(
              borderRadius: BorderRadius.circular(20.0),
              shadowColor: Colors.greenAccent,
              color: Colors.green,
              elevation: 7.0,
              child: GestureDetector(
                onTap: () {
                  //Navigator.of(context).pushNamed('/cussignup');
                 // Navigator.pushNamed(context, '/cussignup');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MySignUp()),
                  );



                },
                child: Center(
                  child: Text(
                    'CUSTOMER',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
