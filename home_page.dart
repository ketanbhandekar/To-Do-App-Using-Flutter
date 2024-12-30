import 'package:flutter/material.dart';
import 'package:todoapp/ToDoTile.dart';
import 'package:todoapp/dialog_box.dart';

class HomePage extends StatefulWidget
{
  const HomePage({super.key});

  @override

  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>
{
  final _controller=TextEditingController();

  List todoList=[
    ["Make Tutorials",false],
    ["Do Exercise",false]
  ];
  void checkBoxchanged(bool?  value,int index)
  {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }
  void deleteTask(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }
  void saveNewTask()
  {
    setState(() {
      todoList.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }
  void createNewTask()
  {
    showDialog(
      context: context,
      builder: (context){
        return DialogBox(
          controller: _controller,
          OnSave: saveNewTask,
          OnCancel: ()=> Navigator.of(context).pop(),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      appBar: AppBar(
        title: Text("To Do"),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child:Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index){
            return ToDoTile(
              taskName: todoList[index][0],
              taskCompleted: todoList[index][1],
              onChanged: (value) => checkBoxchanged(value,index),
              onDelete: () => deleteTask(index), // Pass the delete callback
            );
          }
      ),
    );
  }
}