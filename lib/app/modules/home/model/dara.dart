class ListDatas {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  ListDatas({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });

  factory ListDatas.fromJson(Map<String, dynamic> json) => ListDatas(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
      };
}
