abstract class TeasEvent {}

class LoadTeasEvent extends TeasEvent {}

class SearchTeasEvent extends TeasEvent {
  final String query;

  SearchTeasEvent({required this.query});
}

