import 'package:obah_mobile/models/Event.dart';

List<Event> _mockData = List.generate(20, (int index) {
  return Event(
    title: "Event $index",
    type: EventTypes.happyHour,
    participants: index*2
  );
});

Future<Event> createEvent(Event event) async {
  return Future.delayed(Duration(seconds: 1), () {
    event.id = 1;
    event.isNewRecord = false;
    return event;
  });
}

Future<bool> removeEvent(Event event) async {
  return Future.delayed(Duration(seconds: 1), () {
    event.id = 1;
    event.isNewRecord = false;
    return true;
  });
}

Future<List<Event>> loadMyEvents() async {
  return Future.delayed(Duration(seconds: 1), () {
    return _mockData;
  });
}
