import 'package:easyprint/customer/cushome.dart';
import 'package:flutter/material.dart';
class OrderConfirmation extends StatelessWidget {
  int number2;
  OrderConfirmation(int number){
    this.number2=number;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    body:Container(
      padding: EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //crossAxisAlignment: CrossAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 2.0, spreadRadius: 1.0, color: Colors.grey)
                    ]
                ),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 20,),

                    Text('ThankYou',style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.black26
                    ),),
                    SizedBox(height: 20,),
                    Text('Your order has been confirmed and the order number is $number2 ',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54

                    ),
                    textAlign: TextAlign.center,),
                  ],
                ),
              ),

            ),
            SizedBox(height: 20,),
          Expanded(
            
          child:Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 2.0, spreadRadius: 1.0, color: Colors.grey)
                ]
            ),
            padding: EdgeInsets.all(30),
            child: GestureDetector(
              child: Text('Tap here to go to home',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
              textAlign: TextAlign.center,),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Home()),
                );



              },
            ),

          )
          )],
      ),
    ),);
  }
}
