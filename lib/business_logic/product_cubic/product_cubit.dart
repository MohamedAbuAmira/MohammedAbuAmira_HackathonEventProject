import 'package:bloc/bloc.dart';
import 'package:elancer_hackathon/data/models/event.dart';
import 'package:elancer_hackathon/data/repository/event_detials_repository.dart';
import 'package:meta/meta.dart';
part 'product_state.dart';

class EventDetailsCubit extends Cubit<EventDetailsState> {
  final EventDetialsRepository eventDetialsRepository;
  Event? event;
  EventDetailsCubit(this.eventDetialsRepository) : super(EventDetailsInitial());

  Event? getEventDetials() {
    eventDetialsRepository.getEventDetials().then((event_) {
      emit(EventDetailsLoaded(event_)); //sent to ui the state
      this.event = event_;
    });

    return event;
  }
}
