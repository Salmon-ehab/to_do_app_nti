class TaskModelHome {
  String? createdAt;
  String? description;
  int? id;
  String? imagePath;
  String? title;

  TaskModelHome(
      {this.createdAt, this.description, this.id, this.imagePath, this.title});

  factory TaskModelHome.fromJson(Map<String, dynamic> json) {
    return TaskModelHome(
      createdAt: json['created_at'],
      description: json['description'],
      id: json['id'],
      imagePath: json['image_path'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['created_at'] = createdAt;
    data['description'] = description;
    data['id'] = id;
    data['image_path'] = imagePath;
    data['title'] = title;
    return data;
  }
}
