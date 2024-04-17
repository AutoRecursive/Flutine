import 'package:flutter/material.dart';

import '../models/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final Function(bool?) onStatusChanged;
  final Function() onTap;
  final Function() onEdited;

  const TodoItem({
    Key? key,
    required this.todo,
    required this.onStatusChanged,
    required this.onTap,
    required this.onEdited,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Checkbox(
        value: todo.status == TodoStatus.finished,
        onChanged: onStatusChanged,
      ),
      title: Text(todo.title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(todo.description),
          SizedBox(height: 4),
          Text(
            'Status: ${todo.status.toString().split('.').last}',
            style: const TextStyle(
              color: const Color.fromARGB(255, 33, 32, 32),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
