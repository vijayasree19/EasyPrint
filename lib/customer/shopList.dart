import 'package:easyprint/customer/takeOrder.dart';
import 'package:flutter/material.dart';
import 'shop.dart';


class MyShopList extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Shop> shops=[
    Shop(name:"Shakthi Printers",address: "H No: 1-9,Hitech City Road, Madhapur,Hyderabad,Durgam Cheruvu Metro Station" ,
        url:"shanthi_prints.jpg" ,rating: "4.5" ),
    Shop(name: "Pixel Print Shop " ,address: "House No 1-98, Arunodaya Colony, Madhapur, Hyderabad - 500081, Opp: Hitech Theater, Or Opp: SBI Atm" ,
        url:"img2.jpg" ,rating: "4.3"),
    Shop(name: "Sri Digital Printers",address: "House No: 403 Manisai Kalyana Arcade, Balaji Nagar, Miyapur, Hyderabad - 500049, Near By Angara Restaurant , Miyapur X Roads" ,
        url: "img3.jpg",rating:"4.6" ),
    Shop(name:"Y R Design & Printers" ,address: "House No 3-2-307, R P Road, Rashtrapati Road, Hyderabad - 500003, Near Kanyaka Parameshwari Temple" ,
        url: "img4.jpg",rating: "4.0"),
    Shop(name: "Pruthvi Print Shop",address: "98/13/3/2, Hitech City Rd, Opposite SBI ATM, Sri Sai Nagar, Madhapur, Hyderabad, Telangana 500081" ,
        url:"img5.jpg" ,rating:"3.0" ),
    Shop(name: "Royal Colour Xerox",address: "Shop No 6-2-974/22/G23, Shajahan Apartments, Kharitabad Main Road, Khairatabad, Hyderabad - 500004, Beside Muncipal Corparation Of Hyderabad" ,
        url: "img6.jpg",rating:"" ),
    Shop(name: "Ardent Id & Print Solutions " ,address: "House No 1-8-87 Ground Floor, Beside Halftone Office, Street 10, Chikkadpally, Hyderabad - 500020" ,
        url:"img7.jpg" ,rating: ""),
    Shop(name: "Print Buzz ",address: "House No : 1-8-3/17, Surya Nagar, Chikkadpally, Hyderabad - 500020," ,
        url: "img8.jpg",rating:"4.0" ),
    /*Shop(name:"" ,address: "" ,
        url: "",rating: ""),
    Shop(name: "",address: "" ,
        url:"" ,rating:"" ),
    Shop(name: "",address: "" ,
        url: "",rating:"" ),*/

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 25.0, top: 45.0, right: 25.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Discover",
                        style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CircleAvatar(
                        backgroundImage:
                         // AssetImage('images/bg.jpg'),
                        NetworkImage(
                            "https://www.binarytides.com/blog/wp-content/uploads/2018/07/hp-laserjet-p1108-laser-printer.jpg"),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
            Container(
              child: Expanded(
                  child: ListView.builder(itemBuilder: (context,index) {
                    return buildItem(shops[index].name,shops[index].address,shops[index].url,shops[index].rating);
                  },
                  itemCount: shops.length,),


              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildItem(
      String title, String subTitle, String url, String rating) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.0),
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: <Widget>[
          FlatButton(
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/$url'),
                      //NetworkImage(url),

                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(

                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    )),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyTakeOrder(title)),
                );

              },
              padding: EdgeInsets.all(0)
          ),
          Container(
            padding: EdgeInsets.all(25.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 2.0, spreadRadius: 1.0, color: Colors.grey)
                ]
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                    child:
                    Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0),
                        ),
                        Text(
                          subTitle,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                              color: Colors.grey),
                        ),
                      ],
                    )),
                CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: Text(
                    rating.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildTopChip(String label, bool isActive) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: Chip(
        padding: EdgeInsets.all(8.0),
        label: Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        backgroundColor: isActive ? Colors.orange : Colors.grey,
      ),
    );
  }
}
