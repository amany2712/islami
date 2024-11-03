import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/tabs/hadeth/hadeth.dart';
import 'package:islami/tabs/hadeth/hadeth_content_screen.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<hadeth> ahadeth =[];

  @override
  Widget build(BuildContext context) {
    if (ahadeth.isEmpty){
      LoadadethFile();};
    return Column(children: [
      Image.asset('assets/images/hadeth_logo.png',
      height: MediaQuery.sizeOf(context).height*0.25,
      //width: MediaQuery.sizeOf(context).width*.96,
      
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
         SizedBox(height: 9,),
         Row(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
          Text("الأحاديث",
          
          style: Theme.of(context).textTheme.headlineSmall,
          
          )]),
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
      
      Expanded(
        child: ListView.separated(
          padding: EdgeInsets.only(top: 10),   // add space between picture and items (list).
          itemCount: ahadeth.length, // Add this to specify the number of items
          itemBuilder: (_,index) => GestureDetector(
            onTap: () => Navigator.of(context).pushNamed(HadethContentScreen.routeName,arguments: ahadeth[index]) ,
            

            child: Text(
              ahadeth[index].title,
              style:Theme.of(context).textTheme.headlineSmall,  //to access textStyle that in app theme.
            textAlign:TextAlign.center ,
            ),
          ),
          separatorBuilder: (_, __) => SizedBox(height: 11,),
          ),
      )
      ],
      
    );
  }

 Future< void> LoadadethFile ()async{
   String ahadethFileContent=
       await rootBundle.loadString('assets/files/ahadeth.txt');
   List <String> ahadethStrings = ahadethFileContent.split('#');
   ahadeth = ahadethStrings.map((hadethString) {
  List <String>  hadethLines =hadethString.trim().split('\n');  //trim=> remove whitesSpaces (tab or enter) from first to end
    String title = hadethLines[0];
    hadethLines.removeAt(0);
   List <String> content= hadethLines;
   return hadeth(title, content);


   } ).toList();
   setState(() {});
  }
}