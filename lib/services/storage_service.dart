import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../models/todo.dart';

class StorageService {
  static const String fileName = 'todos.json';

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$fileName');
  }

  Future<void> saveTodos(List<Todo> todos) async {
    final file = await _localFile;
    final data = todos.map((todo) => todo.toJson()).toList();
    await file.writeAsString(json.encode(data));
  }

  Future<List<Todo>> loadTodos() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();
      final data = json.decode(contents) as List;
      return data.map((item) => Todo.fromJson(item)).toList();
    } catch (e) {
      // 如果出现错误（例如文件不存在），返回一个空列表
      return [];
    }
  }
}