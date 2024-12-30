import 'package:flutter/material.dart';
import 'package:todoapp/my_button.dart';

class DialogBox extends StatelessWidget
{
  final controller;
  VoidCallback OnSave;
  VoidCallback OnCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.OnSave,
    required this.OnCancel,
  });

  @override

  Widget build(BuildContext context)
  {
    return AlertDialog(
      backgroundColor: Colors.teal,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

          TextField(
            controller: controller,
            decoration: InputDecoration(border: OutlineInputBorder(),
              hintText: "Add a New Task",
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MyButton(text: "Save", onPressed: OnSave),
              const SizedBox(width: 8),
              
              MyButton(text: "Cancel", onPressed: OnCancel),
            ],
          )
        ],),
      ),
    );
  }
}