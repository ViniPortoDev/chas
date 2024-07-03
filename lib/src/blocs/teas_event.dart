import 'package:chas/src/models/tea_model.dart';

abstract class TeasEvent {}

class LoadTeasEvent extends TeasEvent {}

class SearchTeasEvent extends TeasEvent {
  final String query;

  SearchTeasEvent({required this.query});
}

class TeasFilterEvent extends TeasEvent {
  final String category;

  TeasFilterEvent({required this.category});
}
