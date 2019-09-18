import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:obah_mobile/pages/add-event.page.dart';

class DrinkTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Drink"),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddEvent(), fullscreenDialog: true))
            },
            child: Icon(Icons.add_circle_outline),
          ),
        ],
      ),
    );
  }
}
