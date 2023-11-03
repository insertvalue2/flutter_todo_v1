class TodoDto {
  String title;
  bool completed;

  // dio lib 가 json 형식으로 알아서 변환 해 준다.
  TodoDto({required this.title, required this.completed});

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'completed': completed,
    };
  }

  @override
  String toString() {
    return 'TodoDto{title: $title, completed: $completed}';
  }
}
