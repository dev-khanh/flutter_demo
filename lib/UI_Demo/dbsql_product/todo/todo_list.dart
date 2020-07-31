import 'package:flutter/material.dart';
import 'package:flutterappexample/UI_Demo/dbsql_product/bloc/todo_bloc.dart';
import 'package:flutterappexample/UI_Demo/dbsql_product/event/delete_todo_event.dart';
import 'package:flutterappexample/UI_Demo/dbsql_product/model/todo.dart';
import 'package:provider/provider.dart';

class TodoList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TodoListState();
}

class TodoListState extends State<TodoList> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var bloc = Provider.of<TodoBloc>(context);
    bloc.initData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoBloc>(
        builder: (context, bloc, child) => StreamBuilder<List<Todo>>(
            stream: bloc.todoListStream,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.active:
                  return Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                snapshot.data[index].content ?? "aa",
                                style: TextStyle(fontSize: 22.0),
                              ),
                              trailing: GestureDetector(
                                onTap: () {
                                  bloc.event.add(
                                      DeleteTodoEvent(snapshot.data[index]));
                                },
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            );
                          }));
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Container(
                      padding: EdgeInsets.only(top: 200.0),
                      child: Text('Empty',
                          style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.italic)));
                default:
                  return Container(
                      padding: EdgeInsets.only(top: 200.0),
                      width: 69.0,
                      height: 69.0,
                      child: CircularProgressIndicator());
              }
            }));
  }
}
