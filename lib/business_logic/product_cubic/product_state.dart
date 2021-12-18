part of 'product_cubit.dart';

@immutable
abstract class EventDetailsState {}

class EventDetailsInitial extends EventDetailsState {}

class EventDetailsLoaded extends EventDetailsState {
  final Event event;

  EventDetailsLoaded(this.event);
}
