import 'dart:async';
import 'dart:math';
import 'package:flutterappexample/UI_Demo/dbsql_product/base/base_bloc.dart';
import 'package:flutterappexample/UI_Demo/dbsql_product/base/base_event.dart';
import 'package:flutterappexample/UI_Demo/dbsql_product/db/todo_table.dart';
import 'package:flutterappexample/UI_Demo/dbsql_product/event/add_todo_event.dart';
import 'package:flutterappexample/UI_Demo/dbsql_product/event/delete_todo_event.dart';
import 'package:flutterappexample/UI_Demo/dbsql_product/model/todo.dart';

class TodoBloc extends BaseBloc {
  StreamController<List<Todo>> _todoListStreamController = StreamController();

  Stream<List<Todo>> get todoListStream => _todoListStreamController.stream;

  TodoTable _todoTable = TodoTable();

  var _randomInt = Random();

  List<Todo> _list = List();

  initData() async {
    _list = await _todoTable.selectAllTodo();
    if (_list == null) return;
    _todoListStreamController.sink.add(_list);
  }

  _addTodo(Todo todo) async {
    //insert to db
    await _todoTable.insertTodo(todo);

    _list.add(todo);
    _todoListStreamController.sink.add(_list);
  }

  _deleteTodo(Todo todo) async {
    await _todoTable.deleteTodo(todo);

    _list.remove(todo);
    _todoListStreamController.sink.add(_list);
  }

  @override
  void dispatchEvent(BaseEvent event) {
    if (event is AddTodoEvent) {
      Todo todo = Todo(_randomInt.nextInt(100000), event.content);
      _addTodo(todo);
    } else if (event is DeleteTodoEvent) {
      _deleteTodo(event.todo);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _todoListStreamController.close();
  }
}
