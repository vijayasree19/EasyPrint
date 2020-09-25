import 'package:flutter/material.dart';
class MySearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,

      home: MySearchHome(),
    );
  }
}
class MySearchHome extends StatefulWidget
{
  @override
  _MySearchHomePage createState() => _MySearchHomePage();
}
class _MySearchHomePage extends State<MySearchHome>
{
  @override
  Widget build(BuildContext context)
  {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Make Order'),
      ),
    );
  }
}

