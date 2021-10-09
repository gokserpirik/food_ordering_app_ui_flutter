import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'aboutApp.dart';
import 'foodDetail.dart';
import 'seeFoods.dart';



import 'colors.dart';
import 'info/categories.dart';
import 'info/foods.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.catamaranTextTheme( TextTheme( headline1:TextStyle(color: colors[0], fontSize: 24, fontWeight: FontWeight.w700), 
        headline2: TextStyle(color: colors[2], fontWeight: FontWeight.w600,fontSize: 22),
         headline4: TextStyle(color: colors[2], fontWeight: FontWeight.w600,fontSize: 26), //2 nin günceli
         headline3: TextStyle(color: colors[1], fontWeight: FontWeight.w600,fontSize: 20),
         bodyText1: TextStyle(color: colors[1], fontWeight: FontWeight.w400,fontSize: 15,height: 0.6),
         bodyText2: TextStyle(color: colors[1], fontWeight: FontWeight.w400,fontSize: 15,height: 1.2)),),
      
        scaffoldBackgroundColor: colors[1]
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
   
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

      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
      
            // ! TOP PAGE 
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical:10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Builder(
                    builder:(context) => InkWell(onTap: () { 
                    
                        Scaffold.of(context).openDrawer();;},child: Icon(FontAwesomeIcons.bars, color: colors[0],)),
                  ),
                  // TODO name should be here:
                  Text("Order Food", style: Theme.of(context).textTheme.headline1 ,),
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
      
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Row(
                   
                  children: List.generate(10, (index) {
                    return discountList(index);
                  }),
                ),
              ),
            ),
      
            //! Categories
            Column(
              children: List.generate(categs.length, (index) {
                return cat(index);
      
              }),
            )
          ],
        ),
      ),


      floatingActionButton: FloatingActionButton(
        backgroundColor: colors[0],
        onPressed: (){
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
                         foodDetail(foodname: -1,),)
                  );
        },
        //onPressed: _incrementCounter,
        //tooltip: 'Increment',
        child: Icon(FontAwesomeIcons.random, color: colors[1], size: 15,),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  
  discountList(index){
    double widthIwant = MediaQuery.of(context).size.width*(0.6).toDouble();
    double heightIwant = MediaQuery.of(context).size.width*(0.4).toDouble();
    return 
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
      child: Row(
        children:[ Container(
          
          width: widthIwant,
          height:heightIwant,
          child: Stack(
            children: [
              //
              Container(
                // * Also you can edit images and connect them to a list but in this case I pass that part
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), image: DecorationImage(image: NetworkImage("https://images.unsplash.com/photo-1529042410759-befb1204b468?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=686&q=80"),fit: BoxFit.fitWidth)),
                
              ),
              Container(
             
                decoration: BoxDecoration(gradient: LinearGradient(colors: [colors[1],colors[1].withOpacity(0.6),Color.fromRGBO(1, 1, 1, 0.0)],begin: Alignment.bottomCenter, 
                end: Alignment.topCenter), borderRadius: BorderRadius.circular(20),)
              ),
    
              Positioned(width: widthIwant ,child: Center(child: Text(fooda[index]["foodName"], style: Theme.of(context).textTheme.headline2,)), bottom: 10,)
            ],
          ),
        ),
        
        SizedBox(width: 20,)
        ]
      ),
    );

  }
  
  cat(index){
   
    
    return Padding(
       padding: const EdgeInsets.symmetric(horizontal: 15, vertical:10),
      child: InkWell(
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
                         seeFoods(foodindex: index ),)
                  );
        
        },
        child: Container(
          height: 80,
          decoration: BoxDecoration(gradient: LinearGradient(colors: [colors[2],Colors.white] ),
          borderRadius:BorderRadius.circular(10),),
          width: MediaQuery.of(context).size.width*(0.95).toDouble(),
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                CircleAvatar(backgroundColor: colors[1],child: categs[index][2], radius: 25,),
                SizedBox(width: 10,),
                Column(
                  mainAxisAlignment:MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(categs[index][0], style: Theme.of(context).textTheme.headline3 ),
        
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    )

 ; }


}
