class RemoteTask {
  final int id;
  final String title;

  RemoteTask({required this.id, required this.title});

  factory RemoteTask.fromJson(Map<String, dynamic> json) {
    return RemoteTask(
      id: json['id'],
      title: json['title'],
    );
  }
}
