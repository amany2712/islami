import 'package:flutter/material.dart';

class StettingsProvider with ChangeNotifier {
ThemeMode themeMode = ThemeMode.light;
String languageCode = 'en';


bool get isDark => themeMode == ThemeMode.dark;


String get backgroundImageName => isDark ?  'dark_bg' :'bg3' ;        //We made a geter to return the picture 

String get imageNameBodySebha => isDark ? 'body_sebha_dark' : 'body_sebha_logo';
String get imageNameHeadSebha => isDark ? 'head_sebha_dark' : 'head_sebha_logo';



void changeTheme (ThemeMode selectedTheme){
      themeMode = selectedTheme;
      notifyListeners();

}

void changeLanguage (String selectedLanguage){
  if (selectedLanguage==languageCode) return; //So that the function does not repeat itself when I choose the same existing language
  languageCode = selectedLanguage;
  notifyListeners();
}

}