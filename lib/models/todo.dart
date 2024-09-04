class Todo {
  final String id;
  final String title;
  final String description;
  TodoStatus status;

  Todo({
    required this.id,
    required this.title,
    this.description = '',
    this.status = TodoStatus.notStarted,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'status': status.index,
    };
  }

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'],
      description: json['description'] ?? '',
      status: TodoStatus.values[json['status'] ?? 0],
    );
  }
}

enum TodoStatus { notStarted, ongoing, finished }

extension TodoStatusExtension on TodoStatus {
  String get name {
    return toString().split('.').last;
  }
}