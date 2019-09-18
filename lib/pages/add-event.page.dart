import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:obah_mobile/components/main.dart';
import 'package:obah_mobile/models/Event.dart';

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

  void _onCreateClick() {
    print(event);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          event.title.isEmpty ? "Add Evento" : event.title,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: _onChangeTitle,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: "Nome do Evento"),
            ),
            SizedBox(
              height: 10,
            ),
            DatePicker(
              onChange: _onSelectDate,
            ),
            SizedBox(
              height: 10,
            ),
            RadioGroup(
              onChange: _setTypeEvent,
              options: [
                Option(label: "Comida e Bebida", value: 0, selected: true),
                Option(label: "Lazer e Esportes", value: 1),
                Option(label: "Bate Papo e Diversão", value: 2),
                Option(label: "Encontro particular", value: 3),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: FlatButton(
        onPressed: _onCreateClick,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          child: Container(
            color: Colors.blue,
            height: 40,
            child: Center(
              child: Text(
                "Criar Evento",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
