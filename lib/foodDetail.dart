import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';

import 'colors.dart';
import 'info/foods.dart';
import 'orderPage.dart';

class foodDetail extends StatefulWidget {
  final dynamic foodname;
  const foodDetail({ Key? key,this.foodname }) : super(key: key);

  @override
  _foodDetailState createState() => _foodDetailState();
}

class _foodDetailState extends State<foodDetail> {
  dynamic number = 0;
  dynamic fullwidth ;
   dynamic fullheight;

  @override
  Widget build(BuildContext context) {
  fullwidth = MediaQuery.of(context).size.width;
  fullheight = MediaQuery.of(context).size.height;
   
   // * Random index maker. Which will help us to choose a random food to order!
  if (int.parse("${widget.foodname}") > -1) {
    number = int.parse("${widget.foodname}");
 
}else{ var rng = new Random();
  number = rng.nextInt(39);}

 
    
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Stack(
              children: [Image.network("https://images.unsplash.com/photo-1529042410759-befb1204b468?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=686&q=80"
              ,height:MediaQuery.of(context).size.width*(0.4).toDouble(),width: fullwidth,fit: BoxFit.cover,),
              Container(
                height: MediaQuery.of(context).size.width*(0.4).toDouble(), width: fullwidth,
                decoration: BoxDecoration(gradient: LinearGradient(colors: [colors[1],Colors.transparent],begin: Alignment.bottomCenter, end: Alignment.topCenter),)
              ),
              Positioned(bottom:0,child: Container(child: Center(child: Text(fooda[number]["foodName"], style: Theme.of(context).textTheme.headline4,)),width: fullwidth,))
              ],
            ),
            SizedBox(height: 50,),
            Container(
              width: fullwidth*(0.8).toDouble(),
            
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),gradient: LinearGradient(colors: [colors[2],Colors.white],begin: Alignment.topCenter,end: Alignment.bottomCenter)),
              child: Padding(
                padding: const EdgeInsets.only(left:8.0,right: 8,top: 25,bottom: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Details here", style: Theme.of(context).textTheme.bodyText1,),
                    Column(children: List.generate(3, (index) {return foodsellers(index);}),)
                  ]
                ),
              ),
            )
          ],
        ),
      ),
    ) 
    ;
  }
  foodsellers(index){
   
    
    return Padding(
       padding: const EdgeInsets.symmetric(horizontal: 15, vertical:10),
      child: Container(
        height: 80,
        decoration: BoxDecoration(gradient: LinearGradient(colors: [colors[2],Colors.white] ),
        borderRadius:BorderRadius.circular(10),),
        width: MediaQuery.of(context).size.width*(0.95).toDouble(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(backgroundColor: colors[1],child: Icon(FontAwesomeIcons.motorcycle, color: colors[0],), radius: 25,),
                SizedBox(width: 10,),
                Text("Market"+index.toString(), style: Theme.of(context).textTheme.headline3 ),
              ],
            ),
            InkWell(
              onTap: (){
                Navigator.push(
                context,
                PageRouteBuilder(
                    transitionDuration: Duration(seconds: 1),
                    transitionsBuilder: (context, animation, animationTime, child) {
                      animation = CurvedAnimation(
                          parent: animation, curve: Curves.linearToEaseOut);
                      return ScaleTransition(
                        alignment: Alignment.center,
                        scale: animation,
                        child: child,
                      );
                    },
                    pageBuilder: (context, animation, animationTime)=>
                       orderPage(),)
                );
        
              },
              child: Container(
                decoration: BoxDecoration(gradient: LinearGradient(colors: [colors[1],colors[3]]),borderRadius: BorderRadius.circular(10)),
                width: 40,height:40,child: Center(child: FaIcon(FontAwesomeIcons.shoppingBag, color: colors[0],size: 20,)),),
            )
          ],
        ),
      ),
    )

 ; }
}
