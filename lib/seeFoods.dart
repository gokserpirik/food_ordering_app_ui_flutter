import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodorderapp/info/categories.dart';
import 'colors.dart';
import 'foodDetail.dart';
import 'info/foods.dart';
import 'main.dart';
import 'dart:convert';
class seeFoods extends StatefulWidget {
  final dynamic foodindex;
  const seeFoods({ Key? key, this.foodindex }) : super(key: key);

  @override
  _seeFoodsState createState() => _seeFoodsState();
}

class _seeFoodsState extends State<seeFoods> {
 

  @override
  Widget build(BuildContext context) {
   
    int category = int.parse("${widget.foodindex}");
   
    return Scaffold(
      drawer: Drawer(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*(0.2).toDouble(),
            child: Center(
              child: Text(
                'Order Food',
                style:  Theme.of(context).textTheme.headline1,
              ),
            ),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [colors[1],colors[3]])
                ),
          ),
          
          SizedBox(height: 20,),
          // * I didn't add a List Generator here bc these were my last lines so I choosed to go with classic way to do this part. You can use a list generator as your best way.
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                FaIcon(FontAwesomeIcons.solidUser,color: colors[1],),
                SizedBox(width: 10,),
                Text("Your Profile", style: Theme.of(context).textTheme.bodyText1,)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                FaIcon(FontAwesomeIcons.shoppingBasket ,color: colors[1],),
                SizedBox(width: 10,),
                Text("Orders", style: Theme.of(context).textTheme.bodyText1,)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                FaIcon(FontAwesomeIcons.github ,color: colors[1],),
                SizedBox(width: 10,),
                Text("@gokserpirik", style: Theme.of(context).textTheme.bodyText1,)
              ],
            ),
          ),
        ],
      ),
    ),

      body: 
      //Text("${widget.foodindex}")
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical:10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Builder(
                    builder:(context) => InkWell(onTap: () { 
                    
                        Scaffold.of(context).openDrawer();},child: Icon(FontAwesomeIcons.bars, color: colors[0],)),
                  ),
                    // TODO name should be here:
                    Text(categs[category][0], style: Theme.of(context).textTheme.headline1 ,),
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
                       helpMe(),)
                );
                    },
                    child: Icon(FontAwesomeIcons.solidQuestionCircle, color: colors[0],))
                  ],
                ),
              ),
      
            
            Column(children: List.generate(fooda.length-20, (index) {
            
              return fname(index);
      
            }),)
          ],
        ),
      )
    );
  }
  fname(index){
   
    // ! THE INDEX HERE WILL BE FOODS.DART'S INDEX NOT CATEGORY
    return Padding(
       padding: const EdgeInsets.symmetric(horizontal: 15, vertical:10),
      child: InkWell(
        onTap: (){
      
        
        },
        child: Container(
          height: 80,
          decoration: BoxDecoration(gradient: LinearGradient(colors: [colors[2],Colors.white] ),
          borderRadius:BorderRadius.circular(10),),
          width: MediaQuery.of(context).size.width*(0.95).toDouble(),
          child: Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ShaderMask(
  shaderCallback: (rect) {
    return LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [Colors.black, Colors.transparent],
    ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
  },
  blendMode: BlendMode.dstIn,
  child: Image.network("https://images.unsplash.com/photo-1529042410759-befb1204b468?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=686&q=80",
    
    width: 100,
    fit: BoxFit.fitWidth,
  ),
),
                    SizedBox(width: 10,),
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
                         foodDetail(foodname : index),));
                      },
                      child: Text(fooda[index]["foodName"], style: Theme.of(context).textTheme.headline3 )),
                  ],
                ),
                Text(fooda[index]["price"].toString()+"€", style: Theme.of(context).textTheme.bodyText1 ),
              ],
            ),
          ),
        ),
      ),
    )

 ; }
}