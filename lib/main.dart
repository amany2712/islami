import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/home_screen.dart';
import 'package:islami/tabs/hadeth/hadeth_content_screen.dart';
import 'package:islami/tabs/quran/sura_datails_screen.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_)=> StettingsProvider()..getTheme()..getLanguage(),         //object provider ..> make SettingsProvider (inherited widget) know IslamiApp 
    child: IslamiApp()));
}
 class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    StettingsProvider settingsProvider = Provider.of<StettingsProvider>(context);  // access SettingsProvider..make object from settingsprovider and make app is listner to rebuid updates
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName:(_)=>HomeScreen(),
        SuraContentScreen.routeName:(_)=>SuraContentScreen(),
        HadethContentScreen.routeName:(_)=>HadethContentScreen(),
        },
      initialRoute:HomeScreen.routeName ,
      theme:AppTheme.lightTheme ,
      darkTheme: AppTheme.darkTheme,
      themeMode:settingsProvider.themeMode,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    locale: Locale(settingsProvider.languageCode),     //active locale
    );
  }
}