import 'package:flutter/material.dart';
import 'package:easyprint/main.dart';
import 'package:flutter/widgets.dart';


class MyShopDetails extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage1(),
    );
  }
}

class MyHomePage1 extends StatefulWidget {
  @override
  _MyHomePage1State createState() => _MyHomePage1State();
}

class _MyHomePage1State extends State<MyHomePage1> {

  var _formKey = GlobalKey<FormState>();

  TextEditingController NameControlled = TextEditingController();
  TextEditingController ShopNameControlled = TextEditingController();
  TextEditingController MailControlled = TextEditingController();
  TextEditingController PasswordControlled = TextEditingController();
  TextEditingController PhoneControlled = TextEditingController();
  TextEditingController AddressControlled = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 30.0, 0.0, 0.0),
                      child: Text(
                        'Signup',
                        style:
                        TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(255.0, 30.0, 0.0, 0.0),
                      child: Text(
                        '.',
                        style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: NameControlled,
                      // ignore: missing_return
                      validator: (String value) {
                        if(value.isEmpty ) {
                          return 'Please enter your name';
                        }

                      },
                      decoration: InputDecoration(
                          labelText: 'NAME',
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                          errorStyle: TextStyle(
                              color: Colors.deepPurpleAccent,
                              fontSize: 15.0
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.greenAccent))),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: ShopNameControlled,

                      // ignore: missing_return
                      validator: (String value) {
                        if(value.isEmpty ) {
                          return 'Please enter your shop name';
                        }},
                      decoration: InputDecoration(
                          labelText: 'NAME OF THE SHOP',
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: MailControlled,
                      // ignore: missing_return
                      validator: (String value) {
                        if(value.isEmpty ) {
                          return 'Please enter your email address';
                        }
                        if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                          return 'Please enter a valid email address';
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'EMAIL',
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: PasswordControlled,
                      // ignore: missing_return
                      validator: (String value){
                        if(value.isEmpty)
                        {
                          return 'Please enter password';
                        }
                        if(value.length<8)
                        {
                          return 'password must be minimum of length 8';
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'PASSWORD',
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: PhoneControlled,
                      // ignore: missing_return
                      validator: (String value){
                        if(value.isEmpty){
                          return 'Please enter your phone number';
                        }
                        if(!RegExp(r"^(?:[+0]9)?[0-9]{10}$").hasMatch(value)){
                          return 'Invalid phone number';
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'PHONE NUMBER',
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: AddressControlled,
                      // ignore: missing_return
                      validator: (String value) {
                        if(value.isEmpty ) {
                          return 'Please enter your shop address';
                        }},

                      decoration: InputDecoration(
                          labelText: 'ADDRESS',
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
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
