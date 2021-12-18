

import 'package:elancer_hackathon/data/models/event.dart';
import 'package:elancer_hackathon/data/web_service/event_detials_web_service.dart';


class EventDetialsRepository {
  final EventDetialsWebService eventDetialsWebService;

  EventDetialsRepository(this.eventDetialsWebService);

  Future<Event> getEventDetials() async {
    final eventDetialsJson = await eventDetialsWebService.getEventDetials();

    return Event.fromJson(eventDetialsJson);
  }
}
