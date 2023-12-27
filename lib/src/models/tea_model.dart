// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:chas/src/models/tea_commets_model.dart';

class TeaModel {
  final int id;
  final String title;
  final List<dynamic> categories;
  final String description;
  final String imagemUrl;
  final String preparationTime;
  final int likes;
  final List<dynamic> type;
   final bool isFavorite;
  // final List<TeaCommentsModel> comments;

  TeaModel({
    required this.id,
    required this.title,
    required this.categories,
    required this.description,
    required this.imagemUrl,
    required this.preparationTime,
    required this.likes,
    required this.type,
     this.isFavorite = false
    // required this.comments,
  });
 Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'categories': categories,
      'description': description,
      'imagemUrl': imagemUrl,
      'preparationTime': preparationTime,
      'likes': likes,
      'type': type,
      'isFavorite': isFavorite,

      // 'comments': comments.map((x) => x.toMap()).toList(),
    };
  }

  factory TeaModel.fromMap(Map<String, dynamic> map) {
    return TeaModel(
      id: map['id'] as int,
      title: map['title'] as String,
      categories: List<dynamic>.from((map['categories'] as List<dynamic>)),
      description: map['description'] as String,
      imagemUrl: map['image_url'] as String,
      preparationTime: map['preparation_time'] as String,
      likes: map['likes'] as int,
      type: List<dynamic>.from((map['type'] as List<dynamic>)),
      isFavorite: map['isFavorite'] as bool,

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
