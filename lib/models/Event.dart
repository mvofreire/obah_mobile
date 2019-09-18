import 'package:obah_mobile/models/Friend.dart';

class Event {
  String title;
  DateTime date;
  int type;
  List<Friend> friends = [];

  Event({this.title = ''});

  void validate() {
    if (this.title.isEmpty) {
      throw new Exception("É Obrigatorio um titulo.");
    } else if (this.type == null) {
      throw new Exception("É obrigatorio um tipo de evento.");
    } else if (this.date == null || this.date.isBefore(DateTime.now())) {
      throw new Exception("Data precisa ser maior ou igual a hoje.");
    }
  }

  @override
  String toString() {
    return "${this.title}";
  }
}
