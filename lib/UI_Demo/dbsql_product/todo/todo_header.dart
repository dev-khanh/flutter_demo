import 'package:flutter/material.dart';
import 'package:flutterappexample/UI_Demo/dbsql_product/bloc/todo_bloc.dart';
import 'package:flutterappexample/UI_Demo/dbsql_product/event/add_todo_event.dart';
import 'package:provider/provider.dart';

class TodoHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var txtTodoController = TextEditingController();
    var bloc = Provider.of<TodoBloc>(context);
    return Row(
      children: <Widget>[
        Expanded(
          child: TextFormField(
            controller: txtTodoController,
            decoration: InputDecoration(hintText: "Add todo"),
          ),
        ),
        SizedBox(width: 20.0),
        RaisedButton.icon(
          onPressed: () {
            bloc.event.add(AddTodoEvent(txtTodoController.text));
            print(txtTodoController.text);
          },
          label: Text(
            'Add',
            style: TextStyle(fontSize: 18.0, color: Colors.white),
          ),
          icon: Icon(Icons.note_add, color: Colors.white),
        )
      ],
    );
  }
}
