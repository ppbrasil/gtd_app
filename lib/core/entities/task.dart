class Task {
  final int? id;
  final String title;
  final bool? isDone;

  Task({
    this.id = 0,
    required this.title,
    this.isDone,
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
      'id': id,
      'name': title,
      'done': isDone,
    };
  }
}
