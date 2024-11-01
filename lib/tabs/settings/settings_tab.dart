import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/settings/language.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class settingsTab extends StatefulWidget {
  

  @override
  State<settingsTab> createState() => _settingsTabState();
}

class _settingsTabState extends State<settingsTab> {
  List <Language> languages =[
   Language(name: "English", code: "en"),
   Language(name: "العربية", code: "ar")
   ];
   


  @override
  Widget build(BuildContext context) {

    StettingsProvider settingsProvider = Provider.of<StettingsProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppLocalizations.of(context)!.dark_mode,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w500)
              
              ),
              Switch(
                value: settingsProvider.themeMode == ThemeMode.dark,  //The value that will be displayed  .. =>true/false
                 onChanged:(isDark) =>settingsProvider.changeTheme(isDark ? ThemeMode.dark : ThemeMode.light),   //isDark ==Value
                 activeTrackColor: AppTheme.gold,
                  
                 
                 ),
            ],
          ),
          SizedBox(height: 9,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppLocalizations.of(context)!.language,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w500)
              
              ),
              DropdownButtonHideUnderline(    //To hide the line below
                child: DropdownButton<Language>(
                  value: languages.firstWhere((Language) => Language.code == settingsProvider.languageCode),  //The value that will be displayed
                  items: languages.map((Language) => DropdownMenuItem(
                    value:Language ,
                    child: Text(
                      Language.name,
                      style: Theme.of(context).textTheme.headlineLarge,
                      )
                    )
                    )
                    .toList(),
                   onChanged: (selectedLanguage){
                    if (selectedLanguage!=null){
                      settingsProvider.changeLanguage(selectedLanguage.code);
                    }


                   },
                   borderRadius: BorderRadius.circular(18),
                   dropdownColor: settingsProvider.isDark ? AppTheme.darkPrimary : AppTheme.white,
                   
                   ),
              )
                
              
                
              
            ],
          )
        ],
      ),
    );
  }
}