import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DatePicker extends StatefulWidget {
  final DateTime selected;
  final Function(DateTime) onChange;

  DatePicker({this.selected, this.onChange});

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime _date = DateTime.now();

  void _onShowPicker(BuildContext context) async {
    DateTime _seleceted = await showDatePicker(
      context: context,
      firstDate: DateTime(2019),
      lastDate: DateTime(2020),
      initialDate: DateTime.now(),
    );

    if (_seleceted != null && _seleceted != _date) {
      setState(() {
        _date = _seleceted;
      });

      if (widget.onChange != null) {
        widget.onChange(_seleceted);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(Icons.date_range),
          FlatButton(
            child: Text("${_date.toLocal()}"),
            onPressed: () {
              _onShowPicker(context);
            },
          )
        ],
      ),
    );
  }
}
