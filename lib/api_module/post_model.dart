// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<PostModel> welcomeFromJson(String str) => List<PostModel>.from(json.decode(str).map((x) => PostModel.fromJson(x)));

String welcomeToJson(List<PostModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));



class PostModel {
    int userId;
    int id;
    String title;
    String body;

    PostModel({
        required this.userId,
        required this.id,
        required this.title,
        required this.body,
    });

    factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
