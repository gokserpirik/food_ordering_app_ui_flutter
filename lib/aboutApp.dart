import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'colors.dart';

class helpMe extends StatefulWidget {
  const helpMe({ Key? key }) : super(key: key);

  @override
  _helpMeState createState() => _helpMeState();
}

class _helpMeState extends State<helpMe> {
    dynamic fullwidth ;
   dynamic fullheight;
   
  @override
  Widget build(BuildContext context) {
    fullwidth = MediaQuery.of(context).size.width;
    fullheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [Image.network("https://images.unsplash.com/photo-1529042410759-befb1204b468?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=686&q=80"
            ,height:MediaQuery.of(context).size.width*(0.4).toDouble(),width: fullwidth,fit: BoxFit.cover,),
            Container(
              height: MediaQuery.of(context).size.width*(0.4).toDouble(), width: fullwidth,
              decoration: BoxDecoration(gradient: LinearGradient(colors: [colors[1],Colors.transparent],begin: Alignment.bottomCenter, end: Alignment.topCenter),)
            ),
            Positioned(bottom:0,child: Container(child: Center(child: Text("App Help", style: Theme.of(context).textTheme.headline4,)),width: fullwidth,))
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
                Text("Hey there! I made this app to create some sort of mobile-first Food Ordering app. Used Flutter/Dart. It's just UI bc there is no server or 'real' issue to solve. So I just tried to create one food ordering app without a problem to solve. Hope you like it!", style: Theme.of(context).textTheme.bodyText2,)
                ] ,
              ),
            ),
          ),
          SizedBox(height: 40,),
          Center(
            child: Container(
              width: fullwidth*(0.4).toDouble(),
            
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),gradient: LinearGradient(colors: [colors[2],Colors.white],begin: Alignment.topCenter,end: Alignment.bottomCenter)),
              child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(FontAwesomeIcons.github ,color: colors[1],),
                  SizedBox(width: 10,),
                  Text("@gokserpirik", style: Theme.of(context).textTheme.bodyText1,)
                ],
              ),
            ),
            ),
          ),
          
        ],
      ),
    );
  }
  
}
