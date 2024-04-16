import 'package:flutter/material.dart';
import 'package:flutter_application/models/todo.dart';
import 'package:flutter_application/widgets/todo_item.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;
  final Function(String) onTodoStatusChanged;

  const TodoList({
    Key? key,
    required this.todos,
    required this.onTodoStatusChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return TodoItem(
          todo: todo,
          onStatusChanged: (value) {
            onTodoStatusChanged(todo.id);
          },
        );
      },
    );
  }
}