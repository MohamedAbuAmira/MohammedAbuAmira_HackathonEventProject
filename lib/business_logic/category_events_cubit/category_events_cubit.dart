import 'package:bloc/bloc.dart';
import 'package:elancer_hackathon/data/models/event.dart';
import 'package:elancer_hackathon/data/repository/events_repository.dart';
import 'package:meta/meta.dart';

part 'category_events_state.dart';

class CategoryEventsCubit extends Cubit<CategoryEventsState> {
  final CategoryEventsRepository categoryEventsRepository;
  List<Event> categoryEvents = [];
  CategoryEventsCubit(this.categoryEventsRepository)
      : super(CategoryEventsInitial());

  List<Event> getAllCategoryEvents() {
    categoryEventsRepository
        .getCategoryEvents()
        .then((categoryEvents_) {
      emit(CategoryEventsLoaded(
          categoryEvents_)); //sent to ui the state
      this.categoryEvents = categoryEvents_;
    });

    return categoryEvents;
  }
}
