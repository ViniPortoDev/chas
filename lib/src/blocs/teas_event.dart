abstract class TeasEvent {}

class LoadTeasEvent extends TeasEvent {}
class FilterTeasEvent extends TeasEvent {
  final String filter;

  FilterTeasEvent({
    required this.filter,
  });
}
