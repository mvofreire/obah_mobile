import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:obah_mobile/utils/datetime.dart';

class DatePicker extends StatefulWidget {
  final String label;
  final DateTime selected;
  final Function(DateTime) onChange;
  final Icon icon;

  DatePicker({this.selected, this.onChange, this.label = 'label', this.icon});

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
    return ListTile(
      leading: widget.icon,
      title: Text(widget.label),
      trailing: FlatButton(
        child: Text("${dateToPTBR(_date)}"),
        onPressed: () => _onShowPicker(context),
      ),
    );

    // return Container(
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: <Widget>[
    //       Row(
    //         children: <Widget>[
    //           Icon(Icons.date_range),
    //           SizedBox(
    //             width: 16,
    //           ),
    //           Text(widget.label),
    //         ],
    //       ),
    //       FlatButton(
    //         child: Text("${dateToPTBR(_date)}"),
    //         onPressed: () {
    //           _onShowPicker(context);
    //         },
    //       )
    //     ],
    //   ),
    // );
  }
}
