import 'Offer.dart';

enum EventTypes { happyHour, party, conversation, private }

class Event {
  int id;
  String title;
  DateTime date = DateTime.now();
  EventTypes type;
  int participants = 1;
  bool isNewRecord = true;
  List<Offer> offers = [];
  Offer selectedOffer;

  Event({
    this.title = '',
    this.type = EventTypes.happyHour,
    this.date,
    this.participants = 1,
  });

  int offersCount() {
    return this.offers.length;
  }

  void validate() {
    if (this.type == null) {
      throw new Exception("É obrigatorio um tipo de evento.");
    } else if (this.date == null) {
      throw new Exception("Precisamos da data do evento.");
    }
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'date': date,
        'type': type,
        'participants': participants,
      };

  @override
  String toString() {
    return "${toJson()}";
  }
}
