import 'package:flutter/material.dart';

class AppTheme {
  static const Color lightPrimary =Color(0xffB7935F);
  static const Color darkPrimary =Color(0xff141A2E);
  static const Color white =Color(0xffF8F8F8);
  static const Color black =Color(0xff242424);
  static const Color gold =Color(0xffFACC1D);


static ThemeData lightTheme = ThemeData(

 primaryColor: lightPrimary,
 scaffoldBackgroundColor: Colors.transparent,
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(color: Colors.black),
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 30, 
      fontWeight: FontWeight.bold,color:Colors.black,
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
   ),
 bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: lightPrimary,    
   selectedItemColor: black,
    unselectedItemColor: white,
    type:BottomNavigationBarType.fixed,

  ),

  //defines the styles for different levels of text used throughout the app.
  textTheme: TextTheme(
    headlineSmall: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w400,
      color: Colors.black
      
      ),
    headlineLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: Colors.black
      
      ),
  )
  

);
static ThemeData darkTheme = ThemeData();

}
