import 'package:flutter/material.dart';
import '../models/todo.dart';
import '../widgets/todo_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Todo> _todos = [];

  void _addTodo() {
    setState(() {
      final newTodo = Todo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: 'New Todo',
      );
      _todos.add(newTodo);
    });
  }

  void _deleteTodo(String id) {
    setState(() {
      _todos.removeWhere((todo) => todo.id == id);
    });
  }

  void _resetTodos() {
    setState(() {
      _todos.forEach((todo) {
        todo.status = TodoStatus.notStarted;
      });
    });
  }

  void _updateTodoStatus(String id) {
    setState(() {
      final todo = _todos.firstWhere((todo) => todo.id == id);
      todo.status = todo.status == TodoStatus.finished
          ? TodoStatus.notStarted
          : TodoStatus.finished;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutine'),
      ),
      body: TodoList(
        todos: _todos,
        onTodoStatusChanged: _updateTodoStatus,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTodo,
        child: Icon(Icons.add),
      ),
    );
  }
}
