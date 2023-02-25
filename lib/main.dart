
import 'package:carousel_pro/carousel_pro.dart';
import 'package:ecommerce_app1/pages/test.dart';
import 'package:ecommerce_app1/splash.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
//my own import
import 'package:ecommerce_app1/components/horizontal_listview.dart';

import 'components/products.dart';
import 'signin.dart';




Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp() ;
  runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false ,
    home:SplashScreen(),
  ));
}
class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    Widget image_carousel=  Container(
      height: 200.0,
      child: Carousel(
        boxFit:BoxFit.cover,
        images:[
          AssetImage('assets/images/hand.jpg'),
          AssetImage('assets/images/hand.jpg'),
          AssetImage('assets/images/hand.jpg'),
          AssetImage('assets/images/hand.jpg'),
          AssetImage('assets/images/hand.jpg'),
          AssetImage('assets/images/hand.jpg'),

        ],
        autoplay: false,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 8.0,
      ),
    );

    return Scaffold(

      appBar: new AppBar(
        elevation: 0.1,
       backgroundColor: Colors.red,
        title: Center(child: Text('Name')),
        actions: <Widget>[
          new IconButton(onPressed: (){}, icon: Icon(Icons.search),color: Colors.white,),
          new IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart),color: Colors.white,)

        ],
           ),
      drawer: new Drawer(
        child: new ListView(
          children:<Widget> [
            new UserAccountsDrawerHeader(accountName: Text('Eya Yousfi'),
                accountEmail:Text('eya.yousfi@esprit.tn'),
            currentAccountPicture: GestureDetector(
              child: new CircleAvatar(
               backgroundColor: Colors.grey,
               child: Icon(Icons.person,color: Colors.white,),
              ),
            ),
              decoration: BoxDecoration(
                color: Colors.red,
              ),
            ),
//     ---------------  body  ---------------------------------------------

          InkWell(
            onTap: (){},
         child : ListTile(
            title: Text('Settings'),
            leading: const Icon(Icons.settings),
          )
          ),
            InkWell(
                onTap: (){},
                child : const ListTile(
                  title:  Text('About'),
                  leading:  Icon(Icons.help,color: Colors.blue,),
                )
            )
          ],
        ),

      ),

body: ListView(
  children:<Widget>[
    image_carousel,
    //----------------------------------------catégories----------------

    new Padding(
      padding:const EdgeInsets.all(10.0),
      child:new Text(
        'Categories',
        style: new TextStyle(
            fontSize: 20.0
        ),
      ),
    ),


    //----------------------horizontal list ----------------------
  HorizontalListPage(),



    //padding widget
    new Padding(padding: const EdgeInsets.all(10.0),
      child: new Text('Recent products',style: new TextStyle(
          fontSize: 20.0
      ),),),





    //grid view
    Container(
      height: 320.0,
      child: Products(),
    )

  ],
),


      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
          child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.home_outlined,color: Colors.red,),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.favorite_border,color: Colors.red,),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.notifications_none ,color: Colors.red,),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.person_2_outlined ,color: Colors.red,),
                onPressed: () {

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginPage()
                      )
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

