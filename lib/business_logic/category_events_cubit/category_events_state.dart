part of 'category_events_cubit.dart';

@immutable
abstract class CategoryEventsState {}

class CategoryEventsInitial extends CategoryEventsState {}

class CategoryEventsLoaded extends CategoryEventsState {
  final List<Event> categoryEvents;

  CategoryEventsLoaded(this.categoryEvents);
}
