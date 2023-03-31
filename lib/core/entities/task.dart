import 'package:gtd_app/core/readiness.dart';

class Task {
  final int? id;
  final String title;
  final bool isDone;
  final bool isFocus;
  final Readiness readiness;

  Task({
    this.id,
    required this.title,
    this.isDone = false,
    this.isFocus = false,
    this.readiness = Readiness.inbox,
  });

  Task copyWith({
    int? id,
    String? title,
    bool? isDone,
    bool? isFocus,
    Readiness? readiness,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      isFocus: isFocus ?? this.isFocus,
      readiness: readiness ?? Readiness.inbox,
    );
  }

  Task.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['name'] as String,
        isDone = json['done'],
        isFocus = json['focus'],
        readiness = ReadinessExtension.fromString(json['readiness']);

  Map<String, dynamic> toJson() {
    return {
      'name': title,
      'done': isDone,
      'focus': isFocus,
      'readiness': readiness.stringValue,
    };
  }
}
