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
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 30, 
      fontWeight: FontWeight.bold,color:Colors.black,
    ),
    backgroundColor: Colors.transparent

   ),
 bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: lightPrimary,    
   selectedItemColor: black,
    unselectedItemColor: white,
    type:BottomNavigationBarType.fixed,

  )

);
static ThemeData darkTheme = ThemeData();

}
