import'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:newtrialtodoapp/Models/core/constant/theme.dart';
import 'package:newtrialtodoapp/Models/core/core_widgets/custom_text.dart';
import 'package:newtrialtodoapp/View/homepage/Alertdialoge.dart';

 import '../../Models/Database.dart';
import 'taskcomponent.dart';
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}
final _controller = TextEditingController();

class _HomepageState extends State<Homepage> {
  //reference the box

  final _box = Hive.box('newDB');

  tododatabase db = tododatabase();
  @override
  void initState() {
    if (_box.get('todolist') == null)
  {
    db.createintialdata();
  }
    else
      {
        db.loadandgetdata();
      }
    super.initState();
   }

  void checkbox(bool? variable, int index) {
    setState(() {
      db.toDolist[index][1] = !db.toDolist[index][1];
    }
    );
    db.updatedata();
  }
      void savenewtask() {
        setState(() {
          db.toDolist.add([_controller.text, false]);
          _controller.clear();
        });
        Navigator.of(context).pop();
        db.updatedata();

      }

      Cancel()
      {
        Navigator.of(context).pop();
        db.updatedata();

      }


     void createnewtask() {
       showDialog(context: context, builder: (context) {
         return
           Dialogebox(controller: _controller,
             save: savenewtask, cancel: Cancel );
       });
      }
      void Removetask(int index)
      {
        setState(() {
          db.toDolist.removeAt(index);
          db.updatedata();

        });
      }

  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(color: Colors.black,gradient:LinearGradient(begin: Alignment.topCenter ,end:Alignment.bottomCenter, colors: [AppTheme.purple1Color,AppTheme.purple2Color])),
      child: Scaffold(backgroundColor: Colors.purpleAccent,
        appBar:
      AppBar(backgroundColor: Colors.purpleAccent,title:
        //title:
          // Container(decoration: BoxDecoration(color: Colors.black,gradient:LinearGradient(begin: Alignment.topCenter ,end:Alignment.bottomCenter, colors: [AppTheme.purple1Color,AppTheme.purple2Color]) ),
          // child:
        CustomText(text: '     What would you like to do ',textAlign: TextAlign.center,fontWeight:FontWeight.w900,fontSize: 24,)),
      floatingActionButton: FloatingActionButton(
        onPressed: ()
        {
          createnewtask();
        },
        child: Icon(Icons.add),

      ),
      //),
        body:
        ListView.builder(
            itemCount: db.toDolist.length ,
            itemBuilder: (BuildContext context, int index) {


      return ToDocomponent(taskname: db.toDolist[index][0],
      taskcompleted:db.toDolist[index][1] ,
      onChanged: (value)=> checkbox (value ,index),
      removetask:(contex)=> Removetask(index),

        );

        }

      ),
      ),
    );
  }
}
