import 'package:flutter/widgets.dart';

class Option {
  final String label;
  final dynamic value;
  final bool selected;

  Option({@required this.label, @required this.value, this.selected = false});
}
