import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';

class sebhaTab extends StatefulWidget {
  @override
  State<sebhaTab> createState() => _sebhaTabState();
}

class _sebhaTabState extends State<sebhaTab> {
   int counter = 0; //  Number of Tasbeehs
  String TasbeehText = 'سبحان الله'; //   Current text of the tasbih
  double _rotationAngle = 0; //  Angle of rotation

  

  @override
  Widget build(BuildContext context) {
     StettingsProvider settingsProvider = Provider.of<StettingsProvider>(context);
    return Container(
      child: Center(
        child: Stack(
          alignment: Alignment.topCenter, 
          children: [
            Positioned(
              top: 0, //  Adjust the image position at the top.    
              child: Image.asset(
                'assets/images/${settingsProvider.imageNameHeadSebha}.png',
    
    
              ),
            ),

            Positioned(
              top: 73.6, // Adjust the position of the body image below the head.     
              child:GestureDetector ( 
                onTap: _rotateAndIncrementCounter, // Call function to rotate image on click
                  child: AnimatedRotation(
                turns: _rotationAngle, // Each increment of 1 represents a full cycle.
                duration: Duration(seconds: 1), // Recycle time
                child: Image.asset(
                  'assets/images/${settingsProvider.imageNameBodySebha}.png',
                   
                ),
              ),
            ),
            ),

            Positioned(
              top: 350, // Edit this number to locate text below images.
              child: Text(
                'عدد التسبيحات',
                style:  Theme.of(context).textTheme.headlineSmall,
              ),
            ),

            Positioned(
              top: 450,
              child: Container(
                 padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.height * .02,
                  vertical:  MediaQuery.of(context).size.height * .03,
                  ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:settingsProvider.isDark ? AppTheme.darkPrimary : Color.fromARGB(255, 195, 165, 124), 
                  ),
                child: Text(
                  ' $counter', // Display counter value
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
            

            Positioned(
              top: 550, // Edit text position to display current text
              child: Container(

                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.height * .02,
                  vertical:  MediaQuery.of(context).size.height * .01,
                  ),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(34),
                  color: Theme.of(context).primaryColor,
                  ),
                
                child: Text(
                  TasbeehText,
                  style: TextStyle(color: Color(0xffFFFFFF),
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                 
                  ),
                  
                ),
              ),
              
              
            ),

            
          ],
        ),
        
        
        
        
      ),
      
    );    
   
    
  }
  void _rotateAndIncrementCounter() {
    setState(() {
      // Increase the rotation angle by 2 degrees.
      _rotationAngle += 2/ 360; 

      // Increment counter and update text based on counter value
      counter++;
      if (counter <= 33) {
        TasbeehText = 'سبحان الله';
      } else if (counter <= 66) {
        TasbeehText = 'الحمد لله';
      } else if (counter <= 99) {
        TasbeehText = 'الله أكبر';
      }

      if (counter == 99) {
        counter = 0;
        TasbeehText = 'سبحان الله';
      }
    });
  }
  
  
}