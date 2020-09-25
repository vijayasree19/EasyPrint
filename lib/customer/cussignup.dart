import 'package:easyprint/customer/cushomepage.dart';
import 'package:easyprint/services/usermanagement.dart';
import 'package:flutter/material.dart';
import 'package:easyprint/main.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MySignUp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,

      home: MyHomePage2(),
    );
  }
}

class MyHomePage2 extends StatefulWidget {


  @override
  _MyHomePage2State createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2> {

  var _formKey = GlobalKey<FormState>();

  TextEditingController NameControlled = TextEditingController();
  TextEditingController MailControlled = TextEditingController();
  TextEditingController PasswordControlled = TextEditingController();

  final _firestore = Firestore.instance;
  final _auth = FirebaseAuth.instance;


  String _email;
  String _password;
  String _name;

  get async => null;


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // resizeToAvoidBottomPadding: false,
        body: Form(
          key: _formKey,
          //crossAxisAlignment: CrossAxisAlignment.start,
          child: ListView(
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                      child: Text(
                        'Signup',
                        style: TextStyle(
                            fontSize: 80.0, fontWeight: FontWeight.bold
                        ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.fromLTRB(225.0, 110.0, 0.0, 0.0),
                      child: Text(
                        '.',
                        style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.green
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[

                    TextFormField(
                      controller: NameControlled,
                      // ignore: missing_return
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter your name';
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'Name',
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
                          _name = value;
                        });
                      },
                    ),
                    SizedBox(height: 20.0,),
                    TextFormField(
                      controller: MailControlled,
                      // ignore: missing_return
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter your email address';
                        }
                        if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                      },
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
                          _email = value;
                        });
                      },
                    ),
                    SizedBox(height: 20.0,),
                    TextFormField(
                      controller: PasswordControlled,
                      // ignore: missing_return
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter password';
                        }
                        if (value.length < 8) {
                          return 'password must be minimum of length 8';
                        }
                      },
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
                          _password = value;
                        });
                      },
                      obscureText: true,
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
                          onTap: ()  async {
                            if (_formKey.currentState.validate()) {
                              //Navigator.of(context).pushNamed('/cushomepage');
                              FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                  email: _email,
                                  password: _password
                              ).then((signedInUser)  {
                              /*  Firestore.instance.collection("customer")
                                    .document()
                                    .setData({'name': _name});*/

                                UserManagement().storeNewUser(
                                    signedInUser, context);

                              }).catchError((e) {
                                print(e);
                              });


                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MycusPage()),
                              );
                            }
                           // Future<String> getCurrentUID() async {
                            // String uid= (await FirebaseAuth.instance.currentUser()).uid;


                           // Firestore.instance.collection("customer")
                             //   .document(uid)
                               // .setData({'name': _name});

                          },

                          child: Center(
                            child: Text(
                              'SIGNUP',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Container(
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Center(
                            child: Text(
                              'Go Back',
                              style: TextStyle(
                                color: Colors.black,
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


            ],
          ),

        ));
  }
}
 /* Future<void> signIn() async {
    final formState =_formKey.currentState;
    if(formState.validate()) {
      formState.save();
     // FirebaseUser user= await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password)
      try{
        final newuser = await _auth.createUserWithEmailAndPassword(
            email: _email, password: _password);
        _firestore.collection('regdetails').add({ 'email':_email,
          'password':_password,
          'username':_name});
        if(newuser != null) {
          Navigator.pop(
            context,

          );
        }
      }
      catch(e)
      {
        print(e);
      }



    }


  }


}
*/
