import 'package:obah_mobile/models/Offer.dart';

List<Offer> _mockData = List.generate(100, (index) {
  return Offer(title: "teste $index", subtitle: "subtitle $index");
});

Future<List<Offer>> loadCloserPlaces() async {
  return Future.delayed(Duration(seconds: 1), () {
    return _mockData;
  });
}
