
class Todo {
  int userId;
  int id;
  String title;
  bool completed;

  Todo(this.userId, this.id, this.title, this.completed);

  factory Todo.fromJson(Map<String, Object?> json) {
    return Todo(
      json["userId"] as int,
      json["id"] as int,
      json["title"] as String,
      json["completed"] as bool,
    );
  }

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
      };

  @override
  String toString() {
    return 'Todo{userId: $userId, id: $id, title: $title, completed: $completed}';
  }
}