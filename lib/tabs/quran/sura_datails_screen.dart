import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/quran/quran_tab.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:islami/widget/loading_indicator.dart';
import 'package:provider/provider.dart';

class SuraContentScreen extends StatefulWidget {
 static const String routeName='/sura-centent';

  @override
  State<SuraContentScreen> createState() => _SuraContentScreenState();
}

class _SuraContentScreenState extends State<SuraContentScreen> {
 List <String> ayat = [];

  late SuraContentArgs args;

  @override
  Widget build(BuildContext context) {
   args = ModalRoute.of(context)!.settings.arguments as SuraContentArgs;
   if (ayat.isEmpty){
    loadSuraFile();
    }
    StettingsProvider settingsProvider = Provider.of<StettingsProvider>(context);

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image:  AssetImage('assets/images/${settingsProvider.backgroundImageName}.png'),
          fit: BoxFit.fill,

        )
      ),
      
      child: Scaffold(
        appBar: AppBar(
          title: Text('إسلامي'), 
      ),

      body: Container(
         padding: EdgeInsets.all(24),
         margin: EdgeInsets.symmetric(
           vertical: MediaQuery.of(context).size.height * .08,
            horizontal: 30,
            ),
         decoration: BoxDecoration(
            color:
             settingsProvider.isDark ? AppTheme.darkPrimary : AppTheme.white,
            borderRadius: BorderRadius.circular(25),
           ),
        child: Column(
          children: [
            Text(
             args.SuraName,
            style: Theme.of(context).textTheme.headlineSmall,
           ),
         

         //buttom line
         Container(
          decoration: BoxDecoration(
             border: Border(
               bottom: BorderSide(
               color: Color(0xffB7935F),
               width: 1.0,
               ),
             ),
            ),
         ),
         SizedBox(height: 13,),

        Expanded( // Ensures ListView takes up remaining space
           child:ayat.isEmpty
              ?LoadingIndicator()
              : ListView.builder(
             itemBuilder: (_, index) => Text(
                ayat[index],
               textAlign: TextAlign.center,
               style: Theme.of(context).textTheme.headlineLarge,
               ),
             itemCount: ayat.length,
           ),
      ),
    ],
  ),
),



      )
      
      );
      
  }

  //To display sura from files in assets.

 Future <void> loadSuraFile() async{
    // future : Data will come in the future.

   await Future.delayed(Duration(seconds: 2));
   String sura =await rootBundle.loadString('assets/files/${args.index+1}.txt');
    ayat = sura.split('\r\n');
    setState(() {});
    }
} 