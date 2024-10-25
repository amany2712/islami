import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/home_screen.dart';
import 'package:islami/tabs/quran/sura_datails_screen.dart';

void main() {
  runApp(const IslamiApp());
}
 class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName:(_)=>HomeScreen(),
        SuraContentScreen.routeName:(_)=>SuraContentScreen(),
        },
      initialRoute:HomeScreen.routeName ,
      theme:AppTheme.lightTheme ,
    );
  }
}