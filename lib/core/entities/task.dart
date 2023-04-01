import 'package:gtd_app/core/readiness.dart';

class Task {
  final int? id;
  final String? title;
  final bool? isDone;
  final bool? isFocus;
  final Readiness? readiness;
  final String? notes;

  Task({
    this.id,
    this.title,
    this.isDone,
    this.isFocus,
    this.readiness,
    this.notes,
  });

  Task copyWith({
    int? id,
    String? title,
    bool? isDone,
    bool? isFocus,
    Readiness? readiness,
    String? notes,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      isFocus: isFocus ?? this.isFocus,
      readiness: readiness ?? this.readiness,
      notes: notes ?? this.notes,
    );
  }

  Task partialUpdate({
    required int id,
    String? title,
    bool? isDone,
    bool? isFocus,
    Readiness? readiness,
    String? notes,
  }) {
    return Task(
      id: id,
      title: (title == this.title) ? null : title,
      isDone: (isDone == this.isDone) ? null : isDone,
      isFocus: (isFocus == this.isFocus) ? null : isFocus,
      readiness: (readiness == this.readiness) ? null : readiness,
      notes: (notes == this.notes) ? null : notes,
    );
  }

  Task.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['name'] as String,
        isDone = json['done'],
        isFocus = json['focus'],
        readiness = ReadinessExtension.fromString(json['readiness']),
        notes = json['notes'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (title != null) {
      data['name'] = title;
    }
    if (isDone != null) {
      data['done'] = isDone;
    }
    if (isFocus != null) {
      data['focus'] = isFocus;
    }
    if (readiness != null) {
      data['readiness'] = readiness!.stringValue;
    }
    if (notes != null) {
      data['notes'] = notes;
    }
    return data;
  }
}
