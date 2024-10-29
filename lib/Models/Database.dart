import 'package:hive/hive.dart';
import 'package:flutter/material.dart';


 class tododatabase{
  List  toDolist = [];
final _box = Hive.box('newDB');

void createintialdata ()
{
 toDolist = [['study hive',true,'study provider',true]];
}
void loadandgetdata()
{
toDolist = _box.get('todolist');
}
void updatedata()
{
 _box.put('todolist', toDolist);
}
}