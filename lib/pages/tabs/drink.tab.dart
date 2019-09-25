import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:obah_mobile/models/Event.dart';
import 'package:obah_mobile/pages/add-event.page.dart';
import 'package:obah_mobile/services/event.service.dart';

class DrinkTab extends StatelessWidget {
  final Future<List<Event>> myEvents = loadMyEvents();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: myEvents,
        builder: (BuildContext context, AsyncSnapshot<List<Event>> snapshot) {
          Widget content;
          if (snapshot.data == null) {
            content = Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.data.length == 0) {
            content = Center(
              child: Text("Você ainda nao possui nenhum Evento"),
            );
          } else {
            content = ListView(
              children: snapshot.data.map((Event event) {
                return ListTile(
                  onTap: () {},
                  leading: Icon(Icons.today),
                  title: Text(event.title),
                  trailing: Text("c: ${event.participants}"),
                );
              }).toList(),
            );
          }

          return Container(
            child: content,
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () async {
              // var dialog = await showDialog(
              //   context: context,
              //   builder: (context) => Text("teste"),
              // );
              // print(dialog);

              EventDialogAction type = await Navigator.push(
                context,
                MaterialPageRoute<EventDialogAction>(
                  builder: (context) => AddEvent(),
                  fullscreenDialog: false,
                ),
              );
              print(type);
            },
            child: Icon(Icons.add_circle_outline),
          ),
        ],
      ),
    );
  }
}
