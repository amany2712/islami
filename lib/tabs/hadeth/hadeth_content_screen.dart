import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/hadeth/hadeth.dart';
import 'package:islami/tabs/quran/quran_tab.dart';
import 'package:islami/widget/loading_indicator.dart';

class HadethContentScreen extends StatelessWidget {
 static const String routeName='/hadeth-centent';

 List <String> ayat = [];

  late SuraContentArgs args;

  @override
  Widget build(BuildContext context) {
   hadeth args = ModalRoute.of(context)!.settings.arguments as hadeth;
   

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image:  AssetImage('assets/images/bg3.png'),
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
            color: AppTheme.white,
            borderRadius: BorderRadius.circular(25),
           ),
        child: Column(
          children: [
            Text(
             args.title,
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
           child: ListView.builder(
             itemBuilder: (_, index) => Text(
                args.content[index],
               textAlign: TextAlign.center,
               style: Theme.of(context).textTheme.headlineLarge,
               ),
             itemCount: args.content.length,
           ),
      ),
    ],
  ),
),



      )
      
      );
      
  }
} 