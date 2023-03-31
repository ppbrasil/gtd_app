class Task {
  final int? id;
  final String title;
  final bool isDone;

  Task({
    this.id,
    required this.title,
    this.isDone = false,
  });

  Task copyWith({
    int? id,
    String? title,
    bool? isDone,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
    );
  }

  Task.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['name'] as String,
        isDone = json['done'];

  Map<String, dynamic> toJson() {
    return {
      'name': title,
      'done': isDone,
    };
  }
}
