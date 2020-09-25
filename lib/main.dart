
import 'package:easyprint/customer/cushomepage.dart';
import 'package:easyprint/customer/cussignup.dart';
import 'package:easyprint/shopkeeper/shopsignup.dart';
import 'package:easyprint/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase/firebase.dart';
import 'services/usermanagement.dart';


void main() {
  runApp( new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,

      home: MyHomePage(),
      theme: ThemeData(
        primaryColor: Colors.teal,
        accentColor: Colors.teal
      ),
      routes: <String, WidgetBuilder> {
        '/landingpage': (BuildContext context)=> new MyApp(),
        '/signup': (BuildContext context)=> new MyChoice(),
        '/shopsignup': (BuildContext context)=>new MyShopDetails(),
        '/cussignup': (BuildContext context)=>new MySignUp(),
        '/cushomepage': (BuildContext context)=>new MycusPage()


      },
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //resizeToAvoidBottomPadding: false,
      body: Form(
        //crossAxisAlignment: CrossAxisAlignment.start,
        child: ListView(
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                  child: Text(
                    'EASY',
                    style: TextStyle(
                        fontSize: 80.0, fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 175.0, 0.0, 0.0),
                  child: Text(
                    'PRINT',
                    style: TextStyle(
                        fontSize: 80.0, fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(225.0, 175.0, 0.0, 0.0),
                  child: Text(
                    '.',
                    style: TextStyle(
                        fontSize: 80.0, fontWeight: FontWeight.bold,color: Colors.green
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top:35.0,left: 20.0,right: 20.0),
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                      labelText: 'EMAIL',
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)
                      )
                  ),
                  onChanged: (value) {
                    setState(() {
                      _email=value;
                    });
                  },
                ),
                SizedBox(height: 20.0,),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'PASSWORD',
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)
                      )
                  ),
                  onChanged: (value) {
                    setState(() {
                      _password=value;
                    });
                  },
                  obscureText: true,
                ),
                SizedBox(height: 5.0),
                Container(
                  alignment: Alignment(1.0,0.0),
                  padding: EdgeInsets.only(top: 15.0,left: 20.0),
                  child: InkWell(
                    child: Text('Forget Password',
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline
                      ),),


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
                        FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: _email,
                            password: _password
                        ).then((user) {
                         // Navigator.of(context).pushReplacementNamed('cushomepage');
                          Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context)=>MycusPage()),
                          );
                        })
                            .catchError((e){
                              print(e);
                        });


                      },
                      child: Center(
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'New to Easy Print?',
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(width: 5.0),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/signup');
                  /*Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyChoice()),
                  );*/

                },
                child: Text('Register',
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      decoration: TextDecoration.underline
                  ),),
              )
            ],
          )

        ],
      ),

    ));
  }
}

