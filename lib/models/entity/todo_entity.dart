class TodoEntity {
  int id;
  String title;
  bool completed;

  TodoEntity({required this.id, required this.title, required this.completed});

  factory TodoEntity.fromJson(Map<String, dynamic> json) {
    return TodoEntity(
      id: json['id'] as int,
      title: json['title'] as String,
      completed: json['completed'] as bool,
    );
  }
}
