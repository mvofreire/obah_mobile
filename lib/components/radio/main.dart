import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Option {
  final String label;
  final dynamic value;
  final bool selected;

  Option({@required this.label, @required this.value, this.selected = false});
}

class RadioGroup extends StatefulWidget {
  final List<Option> options;
  final Function(Option) onChange;

  RadioGroup({@required this.options, @required this.onChange});

  @override
  _RadioGroupState createState() => _RadioGroupState();
}

class _RadioGroupState extends State<RadioGroup> {
  dynamic _value;

  @override
  void initState() {
    setState(() {
      _value = widget.options.where((item) => item.selected).first.value;
    });
    super.initState();
  }

  void _onTapItem(Option item) {
    setState(() {
      _value = item.value;
      widget.onChange(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    var options = widget.options.map((Option item) {
      return ListTile(
        title: Text(item.label),
        onTap: () => _onTapItem(item),
        leading: Radio(
          value: item.value,
          groupValue: _value,
          onChanged: (dynamic value) {
            _onTapItem(item);
          },
        ),
      );
    }).toList();

    return Center(
      child: Column(
        children: options,
      ),
    );
  }
}
