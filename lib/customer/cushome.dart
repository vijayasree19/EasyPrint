import 'package:easyprint/customer/shopList.dart';
import 'package:easyprint/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
    MaterialApp(
      debugShowCheckedModeBanner: false,
         home: MyShopList(),
    );
  }
}
