import 'package:flutter/material.dart';
import 'package:flutterappexample/UI_Demo/dbsql_product/bloc/todo_bloc.dart';
import 'package:provider/provider.dart';
import 'db/todo_database.dart';
import 'todo/todo_list_container.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TodoDatabase.instanse.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Todo List'),
        ),
        body: Provider<TodoBloc>.value(
          value: TodoBloc(),
          child: TodoListContainer(),
        ),
      ),
    );
  }
}
