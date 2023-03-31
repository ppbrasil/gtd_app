class Task {
  final int? id;
  final String title;
  final bool isDone;
  final bool isFocus;

  Task(
      {this.id,
      required this.title,
      this.isDone = false,
      this.isFocus = false});

  Task copyWith({
    int? id,
    String? title,
    bool? isDone,
    bool? isFocus,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      isFocus: isFocus ?? this.isFocus,
    );
  }

  Task.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['name'] as String,
        isDone = json['done'],
        isFocus = json['focus'];

  Map<String, dynamic> toJson() {
    return {
      'name': title,
      'done': isDone,
      'focus': isFocus,
    };
  }
}
