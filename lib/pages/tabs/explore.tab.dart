import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:obah_mobile/models/Offer.dart';
import 'package:obah_mobile/services/explorer.service.dart'
    show loadCloserPlaces;

class ExploreItemCard extends StatelessWidget {
  ExploreItemCard({@required this.offer, @required this.onClick, this.icon});

  final Offer offer;
  final Function(Offer) onClick;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        elevation: 2,
        child: FlatButton(
          onPressed: () => onClick(offer),
          child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    offer.title,
                    style: Theme.of(context).textTheme.title,
                  ),
                  Text(
                    offer.subtitle,
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class ExploreTab extends StatelessWidget {
  final Future<List<Offer>> places = loadCloserPlaces();

  void _onCLickItem(Offer offer) {
    print(offer);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: places,
      builder: (BuildContext context, AsyncSnapshot<List<Offer>> snapshot) {
        Widget content;
        if (snapshot.data == null) {
          content = Center(
            child: CircularProgressIndicator(),
          );
        } else {
          content = GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            children: snapshot.data.map((Offer offer) {
              return ExploreItemCard(
                offer: offer,
                onClick: _onCLickItem,
              );
            }).toList(),
          );
        }

        return Scrollbar(
          child: content,
        );
      },
    );
  }
}
