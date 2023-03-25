class Task {
  final int? id;
  final String title;

  Task({
    this.id = 0,
    required this.title,
  });

  Task copyWith({
    int? id,
    String? title,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  Task.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['name'] as String;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': title,
    };
  }
}
