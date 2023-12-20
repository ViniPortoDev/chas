import 'dart:convert';
import 'package:chas/src/models/tea_commets_model.dart';

class TeaModel {
  final int id;
  final String title;
  final String category;
  final String description;
  final String imagemUrl;
  final String preparationTime;
  final int likes;
  final List<dynamic> type;
  // final List<TeaCommentsModel> comments;

  TeaModel({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.imagemUrl,
    required this.preparationTime,
    required this.likes,
    required this.type,
    // required this.comments,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'category': category,
      'description': description,
      'imagemUrl': imagemUrl,
      'preparationTime': preparationTime,
      'likes': likes,
      'type': type,
      // 'comments': comments.map((x) => x.toMap()).toList(),
    };
  }

  factory TeaModel.fromMap(Map<String, dynamic> map) {
    return TeaModel(
      id: map['id'] as int,
      title: map['title'] as String,
      category: map['category'] as String,
      description: map['description'] as String,
      imagemUrl: map['image_url'] as String,
      preparationTime: map['preparation_time'] as String,
      likes: map['likes'] as int,
      type: List<dynamic>.from((map['type'] as List<dynamic>)),
      // comments: List<TeaCommentsModel>.from(
      //   (map['comments'] as List<dynamic>).map<TeaCommentsModel>(
      //     (x) => TeaCommentsModel.fromMap(x as Map<String, dynamic>),
      //   ),
      // ),
    );
  }

  String toJson() => json.encode(toMap());

  factory TeaModel.fromJson(String source) =>
      TeaModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
