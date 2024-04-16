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
}

enum TodoStatus { notStarted, ongoing, finished }