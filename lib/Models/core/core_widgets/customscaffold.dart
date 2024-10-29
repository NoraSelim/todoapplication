import 'package:flutter/material.dart';
 import '../constant/theme.dart';

class Customscaffold extends StatelessWidget {
  final Widget body;
  final Widget Appbar;
  final String text;
   const Customscaffold({super.key, required this.body, required this.Appbar, required this.text});


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: AppTheme.purple1Color,
      title: Center(
        child: Text( text,textAlign: TextAlign.center
             ),
      ),
      elevation: 0,
    ),
      body:
      Container(
          child: body,

      height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration:   BoxDecoration(
            gradient:LinearGradient(begin: Alignment.topCenter ,end:Alignment.bottomCenter ,
                colors: [ AppTheme.purple1Color,  AppTheme.purple2Color]
            ),

        ),
      ),


     );
  }
}
