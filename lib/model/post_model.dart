class PostModel {
  int postId;
  int id;
  String name;
  String email;
  String body;

  PostModel({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      postId: json['postId'],
      id: json['id'],
      name: json['name'],
      email: json['email'],
      body: json['body'],
    );
  }
}
