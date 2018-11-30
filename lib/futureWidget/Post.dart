library post;

import 'package:json_annotation/json_annotation.dart';


part 'Post.g.dart';

@JsonSerializable()
class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post(this.userId, this.id, this.title, this.body);

  factory Post.fromJson(Map jsonMap) => _$PostFromJson(jsonMap);
  Map<String, dynamic> toJson() => _$PostToJson(this);

}