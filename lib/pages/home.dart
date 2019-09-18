import 'package:flutter/material.dart';
import 'package:obah_mobile/pages/tabs/main.dart';

class LougoutButton extends StatelessWidget {
  final Function onPressed;
  LougoutButton({@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: this.onPressed,
      child: Row(
        children: <Widget>[
          Icon(Icons.power_settings_new),
          SizedBox(width: 10),
          Text("Logout")
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  static String tag = 'home-page';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Obah"),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.local_drink)),
              Tab(icon: Icon(Icons.location_searching)),
              Tab(icon: Icon(Icons.settings)),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: TabBarView(
            // physics: NeverScrollableScrollPhysics(),
            children: [
              DrinkTab(),
              ExploreTab(),
              ConfigTab(),
            ],
          ),
        ),
      ),
    );
  }
}
