import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:numberpicker/numberpicker.dart';

class NumberPicker extends StatelessWidget {
  final String label;
  final String suffix;
  final int value;
  final ValueChanged<int> onChange;
  final Icon icon;

  NumberPicker({
    @required this.onChange,
    @required this.value,
    this.label = 'label',
    this.suffix = 'total',
    this.icon,
  });

  void _onShowPicker(BuildContext context) async {
    int _value = await showDialog<int>(
        context: context,
        builder: (BuildContext context) => NumberPickerDialog.integer(
              minValue: 1,
              maxValue: 10,
              title: new Text("Pick a new price"),
              initialIntegerValue: this.value,
            ));
    if (_value != null) {
      onChange(_value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: this.icon,
      title: Text("${this.label}"),
      trailing: FlatButton(
        child: Text("${this.value} ${this.suffix}"),
        onPressed: () => _onShowPicker(context),
      ),
    );
  }
}
