import 'package:flutter/material.dart';

import '../models/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final Function(bool?) onStatusChanged;

  const TodoItem({
    Key? key,
    required this.todo,
    required this.onStatusChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: todo.status == TodoStatus.finished,
        onChanged: onStatusChanged,
      ),
      title: Text(todo.title),
      subtitle: Text(todo.description),
    );
  }
}