class Task {
  int id;
  String title;
  String description;
  DateTime createdAt;
  bool isCompleted;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    this.isCompleted = false,
  });

  get dateTime => null;
}
