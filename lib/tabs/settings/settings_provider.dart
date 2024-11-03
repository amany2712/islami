import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StettingsProvider with ChangeNotifier {
ThemeMode themeMode = ThemeMode.light;
String languageCode = 'en';


bool get isDark => themeMode == ThemeMode.dark;


String get backgroundImageName => isDark ?  'dark_bg' :'bg3' ;        //We made a geter to return the picture 

String get imageNameBodySebha => isDark ? 'body_sebha_dark' : 'body_sebha_logo';
String get imageNameHeadSebha => isDark ? 'head_sebha_dark' : 'head_sebha_logo';



void changeTheme (ThemeMode selectedTheme){
      themeMode = selectedTheme;
      saveTheme(selectedTheme);
      notifyListeners();

}

void changeLanguage (String selectedLanguage){
  if (selectedLanguage==languageCode) return; //So that the function does not repeat itself when I choose the same existing language
  languageCode = selectedLanguage;
  saveLanguage(selectedLanguage);
  notifyListeners();
}

//save theme

Future<void> saveTheme (ThemeMode themeMode) async {
 SharedPreferences prefs = await SharedPreferences.getInstance();

 if (themeMode==ThemeMode.light){
  prefs.setString('theme', 'light');

 }else {
  prefs.setString('theme', 'dark');

 }

}

//get theme

void getTheme() async{
   SharedPreferences prefs = await SharedPreferences.getInstance();
   String theme = prefs.getString('theme') ?? "light";

   if (theme =='light'){
    themeMode = ThemeMode.light;
   }else{
       themeMode = ThemeMode.dark;
   }
   notifyListeners();
}

//save language 

void saveLanguage (String language) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (language == 'en'){
    prefs.setString('language', 'en');
  }else {
        prefs.setString('language', 'ar');
  }

}

//get language

void getLanguage ()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String language = prefs.getString('language') ?? 'en';
    if (language == 'en'){
      languageCode= 'en';
    }else {
      languageCode = 'ar';
    }
    notifyListeners();
}

}