import 'package:easyprint/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class MyProfile extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      

      home: MyCusProfilePage(),
    );
  }
}

class MyCusProfilePage extends StatefulWidget {
  @override
  _MyCusProfilePageState createState() => _MyCusProfilePageState();
}

class _MyCusProfilePageState extends State<MyCusProfilePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text('Profile'),
        backgroundColor: Colors.green,
      ),
     body: Container(
       margin: EdgeInsets.all(10.0),
       child: ListView(
         children: <Widget>[
           getImageAsset(),

           TextField(
             decoration: InputDecoration(
               labelText: 'Edit mail',
               hintText: 'mail@gmail.com'
             ),
           ),
           SizedBox(height: 15,),
           TextField(
             decoration: InputDecoration(
                 labelText: 'Change password',
                 hintText: '******'
             ),
             obscureText: true,
           ),
           SizedBox(height: 30,),
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
                     'save changes',
                     style: TextStyle(
                       color: Colors.white,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                 ),
               ),
             ),
           ),
           SizedBox(height: 25,),
           Container(
             height: 40.0,
             child: Material(
               borderRadius: BorderRadius.circular(20.0),
               shadowColor: Colors.greenAccent,
               color: Colors.green,
               elevation: 7.0,
               child: GestureDetector(
                 onTap: () {
                   FirebaseAuth.instance.signOut().then((value){
                    // Navigator.pop(context);
                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>MyApp()),);
                    // Navigator.of(context).pushReplacementNamed('/landingpage');
                   }).catchError((e){
                     print(e);
                   });


                 },
                 child: Center(
                   child: Text(
                     'Log out',
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
     )
    );
  }

  Widget getImageAsset() {
    AssetImage assetImage=AssetImage('images/person.jpg');
    Image image=Image(image: assetImage, width: 125.0,height: 125.0);
    return Container(child: image,margin: EdgeInsets.all(50.0),);
  }
}

