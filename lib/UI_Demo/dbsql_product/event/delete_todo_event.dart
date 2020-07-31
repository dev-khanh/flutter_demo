
import 'package:flutterappexample/UI_Demo/dbsql_product/base/base_event.dart';
import 'package:flutterappexample/UI_Demo/dbsql_product/model/todo.dart';

class DeleteTodoEvent extends BaseEvent {
  Todo todo;

  DeleteTodoEvent(this.todo);
}
