enum EventTypes { happyHour, party, conversation, private }

class Event {
  int id;
  String title;
  DateTime date = DateTime.now();
  EventTypes type;
  int participants = 1;
  bool isNewRecord = true;

  Event({
    this.title = '',
    this.type = EventTypes.happyHour,
    this.date,
    this.participants,
  });

  void validate() {
    if (this.title.isEmpty) {
      throw new Exception("É Obrigatorio um titulo.");
    } else if (this.type == null) {
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
