import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stack_food/Screens/cartScreen.dart';
import 'package:stack_food/Screens/favoritScreen.dart';
import 'package:stack_food/Screens/homeScreen.dart';
import 'package:stack_food/Screens/orderScreen.dart';
import 'package:stack_food/Screens/profileScreen.dart';
import 'package:stack_food/Screens/tabScreen.dart';
import 'package:stack_food/model/Colors.dart';

import 'package:stack_food/model/dataList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DataList()),
      ],
      child: MaterialApp(
        title: 'Stackfood',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: TextTheme(
            //catagory title
            headline6: TextStyle(
              fontFamily: 'Robota',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColor.titleTextColor,
              overflow: TextOverflow.ellipsis,
            ),
            //viewTextButton
            bodyText1: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColor.viewButtonTextColor,
              decoration: TextDecoration.underline,
            ),
            bodyText2: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColor.titleTextColor,

              //height: 20.02,
            ),
            //lebel stack text
            headline1: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 8,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                      headline6: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffB2B2B2),
                    // height: 20.02
                  ))),

          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: TabScreen(),
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          FavoritScreen.routeName: (context) => FavoritScreen(),
          CartScreen.routeName: (context) => CartScreen(),
          OrderScreen.routeName: (context) => OrderScreen(),
          ProfileScreen.routeName: (context) => ProfileScreen(),
        },
      ),
    );
  }
}
