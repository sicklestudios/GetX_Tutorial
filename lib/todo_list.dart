import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial/todo_controller.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  var todoController = Get.put(TodoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
      ),
      body: Obx(() {
        return ListView.builder(
            itemCount: todoController.todos.length,
            itemBuilder: (context, index) {
              var todo = todoController.todos[index];
              return ListTile(
                title: Text(todo.title),
                trailing: Checkbox(
                    value: todo.isDone,
                    onChanged: (val) {
                      todoController.changeStatus(index);
                    }),
              );
            });
      }),
      // body: GetBuilder(
      //     init: TodoController(),
      //     builder: (controller) {
      //       return ListView.builder(
      //           itemCount: controller.todos.length,
      //           itemBuilder: (context, index) {
      //             var todo = controller.todos[index];
      //             return ListTile(
      //               title: Text(todo.title),
      //               trailing: Checkbox(
      //                   value: todo.isDone,
      //                   onChanged: (val) {
      //                     controller.changeStatus(index);
      //                   }),
      //             );
      //           });
      //     }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () =>
            todoController.addTodos("New Todo ${todoController.value}"),
      ),
    );
  }
}
