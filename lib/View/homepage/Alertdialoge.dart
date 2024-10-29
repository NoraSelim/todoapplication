import 'package:flutter/material.dart';
import 'package:newtrialtodoapp/Models/core/core_widgets/custom_button.dart';
import 'package:newtrialtodoapp/Models/core/core_widgets/custom_text.dart';

class Dialogebox extends StatelessWidget {
 final TextEditingController controller;
 final VoidCallback save;
 final VoidCallback cancel;

   Dialogebox({super.key , required this.controller, required this.save, required this.cancel});



  @override
  Widget build(BuildContext context) {
    return  AlertDialog(backgroundColor: Colors.purple[100],
        content:
    Container(height: 140,color: Colors.purple[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextField(
            decoration: const InputDecoration(border: OutlineInputBorder(),hintText: 'Add new task' ),
            controller: controller,
          ),
          Row(
children: [
  CustomButton(onPressed: save, child: const CustomText(text: 'save')),
  CustomButton(onPressed: cancel, child: const CustomText(text: 'Cancel'))
],
          )

        ],

    ),

    ));
  }
}
