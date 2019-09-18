import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:obah_mobile/models/Option.dart';

class ComboBox extends StatelessWidget {
  final Icon icon;
  final String label;
  final dynamic selected;
  final List<Option> options;
  final ValueChanged<Option> onChange;

  ComboBox({
    @required this.options,
    @required this.onChange,
    this.label = '',
    this.icon,
    this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: this.icon,
      title: Text(this.label),
      trailing: DropdownButton<Option>(
        value: this
            .options
            .where((Option item) => item.value == this.selected)
            .first,
        onChanged: (Option option) => onChange(option),
        items: this.options.map((Option item) {
          return DropdownMenuItem<Option>(
            value: item,
            child: Text("${item.label}"),
          );
        }).toList(),
      ),
    );
  }
}
