import 'package:flutter/material.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';

class RadioTab extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
  
    return Container(
      padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.19 ),
      child: Column(
        children: [
          Image.asset('assets/images/${Provider.of<StettingsProvider>(context).imageNameRadio}.png'),

          SizedBox(height:MediaQuery.of(context).size.height*0.05 ),

          Text('إذاعة القرآن الكريم',
          
          style:Theme.of(context).textTheme.headlineSmall ?.copyWith(
            fontWeight: FontWeight.w600
          )),

          SizedBox(height:MediaQuery.of(context).size.height*0.07 ),
          Image.asset('assets/images/${Provider.of<StettingsProvider>(context).imageNameRadioIcon}.png'),


          
        ],
    
    
      ),
    ) ;
  }
}