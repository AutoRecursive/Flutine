import 'package:flutter/material.dart';
import 'package:flutter_application/screens/edit_todo_screen.dart';
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
        description: 'This is a new todo item',
        status: TodoStatus.notStarted,
      );
      _todos.add(newTodo);
    });
  }

  void _deleteTodo(String id) {
    setState(() {
      _todos.removeWhere((todo) => todo.id == id);
    });
  }

  void _editTodo(String id) async {
    final todo = _todos.firstWhere((todo) => todo.id == id);
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EditTodoScreen(
          todo: todo,
          onTodoEdited: (editedTodo) {
            setState(() {
              final index = _todos.indexWhere((todo) => todo.id == id);
              _todos[index] = editedTodo;
            });
          },
        ),
      ),
    );
  }

  void _resetTodos() {
    setState(() {
      _todos = _todos.map((todo) {
        return Todo(
          id: todo.id,
          title: todo.title,
          description: todo.description,
          status: TodoStatus.notStarted,
        );
      }).toList();
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

  void _toggleTodoStatus(String id) {
    setState(() {
      final todo = _todos.firstWhere((todo) => todo.id == id);
      final currentStatus = todo.status;
      final newStatus = currentStatus == TodoStatus.finished
          ? TodoStatus.notStarted
          : TodoStatus.finished;
      _todos = _todos.map((todo) {
        if (todo.id == id) {
          return Todo(
            id: todo.id,
            title: todo.title,
            description: todo.description,
            status: newStatus,
          );
        }
        return todo;
      }).toList();
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
        onTodoDeleted: _deleteTodo,
        onTodoToggled: _toggleTodoStatus,
        onTodoEdited: _editTodo,
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _addTodo,
            tooltip: 'Add Todo',
            child: Icon(Icons.add),
          ),
          SizedBox(width: 16),
          FloatingActionButton(
            onPressed: _resetTodos,
            tooltip: 'Reset Todos',
            child: Icon(Icons.refresh),
            heroTag: null,
          ),
        ],
      ),
    );
  }
}
