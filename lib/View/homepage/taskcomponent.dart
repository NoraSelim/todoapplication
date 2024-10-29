import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../Models/core/core_widgets/custom_text.dart';

class ToDocomponent extends StatelessWidget {
      ToDocomponent({super.key, required this.taskname, required this.taskcompleted, required this.onChanged, required this.removetask, });
    final String taskname;
    final bool taskcompleted;
    final void Function(bool?)? onChanged ;
    final void Function(BuildContext)? removetask;

  @override
  Widget build(BuildContext context) {
    return Slidable(endActionPane: ActionPane(motion:  StretchMotion(),
      children:
      [
        SlidableAction(borderRadius: BorderRadius.circular(12),
          onPressed: removetask, icon: Icons.delete,backgroundColor: Colors.yellow,)

    ],) ,

      child: Padding(
          padding: const EdgeInsets.all(25.0),
          child:
        Container(
            decoration: BoxDecoration(
              color: Colors.white70 ,
              borderRadius: BorderRadius.circular(12)
            ),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Checkbox(value: taskcompleted, onChanged: onChanged , activeColor: Colors.black,),
                  CustomText( text: taskname ,style: TextStyle(decoration: taskcompleted? TextDecoration.lineThrough : TextDecoration.none),),
                ],
              ),
            ),
          ),
      
      ),
    );
  }


}
