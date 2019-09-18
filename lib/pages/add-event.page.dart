import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:obah_mobile/components/main.dart';
import 'package:obah_mobile/models/Event.dart';
import 'package:obah_mobile/models/main.dart';
import 'package:obah_mobile/services/event.service.dart'
    show createEvent, removeEvent;

enum EventDialogAction {
  cancel,
  discard,
  save,
}

class AddEvent extends StatefulWidget {
  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  Event event = new Event();

  void _onChangeTitle(String title) {
    setState(() {
      event.title = title;
    });
  }

  void _setTypeEvent(Option selected) {
    setState(() {
      event.type = selected.value;
    });
  }

  void _onSelectDate(DateTime dayOfEvent) {
    setState(() {
      event.date = dayOfEvent;
    });
  }

  void _setTotalParticipants(int total) {
    setState(() {
      event.participants = total;
    });
  }

  void _onCreateClick() async {
    try {
      event.validate();
      Event model = await createEvent(event);
      print(model);
      Navigator.pop(context, EventDialogAction.save);
    } on Exception catch (e) {
      Navigator.pop(context, EventDialogAction.cancel);
      print(e.toString());
    }
  }

  String dropdown1Value = 'Free';

  @override
  Widget build(BuildContext context) {
    final inputTitle = TextField(
      onChanged: _onChangeTitle,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Nome do Evento",
        hintText: "Beer Talks",
        // icon: Icon(Icons.label),
      ),
    );

    final inputDate = DatePicker(
      icon: Icon(Icons.date_range),
      label: "Data do evento",
      onChange: _onSelectDate,
    );

    final convidados = NumberPicker(
      icon: Icon(Icons.people),
      label: 'Total de pessoas',
      suffix: 'pessoas',
      value: event.participants,
      onChange: _setTotalParticipants,
    );

    final typeEvent = ComboBox(
      label: "Tipo",
      icon: Icon(Icons.fastfood),
      onChange: _setTypeEvent,
      selected: event.type,
      options: <Option>[
        Option(
          label: "Beer Talk",
          value: EventTypes.conversation,
        ),
        Option(
          label: "Bate Papo com comida",
          value: EventTypes.happyHour,
        ),
        Option(
          label: "Festa & Diversão",
          value: EventTypes.party,
        ),
        Option(
          label: "Encontro Particular",
          value: EventTypes.private,
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          event.title.isEmpty ? "Add Evento" : event.title,
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: _onCreateClick,
            child: Text("Salvar"),
          )
        ],
      ),
      body: Scrollbar(
        child: ListView(
          padding:
              const EdgeInsets.only(top: 20, bottom: 30, left: 10, right: 10),
          children: <Widget>[
            inputTitle,
            SizedBox(
              height: 30,
            ),
            inputDate,
            SizedBox(
              height: 10,
            ),
            convidados,
            SizedBox(
              height: 10,
            ),
            typeEvent
          ],
        ),
      ),
    );
  }
}
