import 'package:flutter/material.dart';
import 'package:flutter_application/models/todo.dart';
import 'package:flutter_application/widgets/todo_item.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;
  final Function(String) onTodoStatusChanged;
  final Function(String) onTodoDeleted;
  final Function(String) onTodoToggled;
  final Function(String) onTodoEdited;

  const TodoList({
    Key? key,
    required this.todos,
    required this.onTodoStatusChanged,
    required this.onTodoDeleted,
    required this.onTodoToggled,
    required this.onTodoEdited,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return Dismissible(
          key: Key(todo.id),
          direction: DismissDirection.horizontal,
          onDismissed: (direction) {
            if (direction == DismissDirection.startToEnd) {
              onTodoDeleted(todo.id);
            }
          },
          confirmDismiss: (direction) async {
            if (direction == DismissDirection.startToEnd) {
              return await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Delete?'),
                  content: Text('This action cannot be undone.'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: Text('Keep it'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: Text('Delete'),
                    ),
                  ],
                ),
              );
            } else if (direction == DismissDirection.endToStart) {
              onTodoEdited(todo.id);
              return false;
            }
            return true;
          },
          background: Container(
            color: Colors.redAccent,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 16),
            child: Icon(Icons.delete, color: Colors.white),
          ),
          secondaryBackground: Container(
            color: Colors.greenAccent,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 16),
            child:
                Icon(Icons.edit, color: Colors.white), // 更改图标为 toggle_on
          ),
          child: TodoItem(
            todo: todo,
            onStatusChanged: (value) {
              onTodoStatusChanged(todo.id);
            },
            onTap: () {
              onTodoToggled(todo.id);
            },
            onEdited: () {
              onTodoEdited(todo.id);
            },
          ),
        );
      },
    );
  }
}
