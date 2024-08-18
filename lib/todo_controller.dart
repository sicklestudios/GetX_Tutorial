import 'package:get/get.dart';
import 'package:getx_tutorial/model/todo_model.dart';

class TodoController extends GetxController {
  var todos = <Todo>[].obs;
  int value = 1;

  void addTodos(String title) {
    todos.add(Todo(title: title));
    value++;
    update();
  }

  void changeStatus(int index) {
    todos[index].isDone = !todos[index].isDone;
    todos.refresh();
    update();
  }
}
