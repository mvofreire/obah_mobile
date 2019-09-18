import 'package:flutter/foundation.dart';

class Offer {
  Offer({
    @required this.title,
    this.subtitle = '',
  });

  final String title;
  final String subtitle;
}
