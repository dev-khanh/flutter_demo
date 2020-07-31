import 'package:flutter/material.dart';

import 'todo_header.dart';
import 'todo_list.dart';

class TodoListContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8.0, right: 5.0),
      child: Column(
        children: <Widget>[TodoHeader(), TodoList()],
      ),
    );
  }
}
