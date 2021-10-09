import 'package:flutter/material.dart';
class orderPage extends StatefulWidget {
  const orderPage({ Key? key }) : super(key: key);

  @override
  _orderPageState createState() => _orderPageState();
}

class _orderPageState extends State<orderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(child: Text("I postponed this page. Add to cart pages require a lot of data and makes the app more serious.",style: Theme.of(context).textTheme.headline1,),),
      ),
    );
  }
}