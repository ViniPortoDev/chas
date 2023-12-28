// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:chas/src/models/tea_commets_model.dart';

class TeaModel {
  final int id;
  final String title;
  final List<dynamic> categories;
  final List<dynamic> description;
  final String imagemUrl;
  final int likes;
  bool isFavorite;
  // final List<TeaCommentsModel> comments;

  TeaModel({
    required this.id,
    required this.title,
    required this.categories,
    required this.description,
    required this.imagemUrl,
    required this.likes,
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
      'likes': likes,
      'isFavorite': isFavorite,

      // 'comments': comments.map((x) => x.toMap()).toList(),
    };
  }

  factory TeaModel.fromMap(Map<String, dynamic> map) {
    return TeaModel(
      id: map['id'] as int,
      title: map['title'] as String,
      categories: List<dynamic>.from((map['categories'] as List<dynamic>)),
      description: map['description'] as List<dynamic>,
      imagemUrl: map['image_url'] as String,
      likes: map['likes'] as int,
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

  void favorite() {
    isFavorite = true;
  }

  void unfavorite() {
    isFavorite = false;
  }
}
