import 'package:elancer_hackathon/data/models/event.dart';
import 'package:elancer_hackathon/data/web_service/events_web_service.dart';

class CategoryEventsRepository {
  final CategoryEventsWebService categoryEventsWebService;

  CategoryEventsRepository(this.categoryEventsWebService);

  Future<List<Event>> getCategoryEvents() async {
    final eventsCategory = await categoryEventsWebService.getCategoryEvents();
    return eventsCategory
        .map((categoryEvent) => Event.fromJson(categoryEvent))
        .toList();
  }
}
