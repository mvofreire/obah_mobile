import 'package:flutter/material.dart';
import 'package:obah_mobile/utils/user-session.dart';
import 'pages/home.dart';
import 'pages/login.dart';

void main() => runApp(MyApp());

class WaitingSession extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text("Loading...")],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  final UserSession session = new UserSession();
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    HomePage.tag: (context) => HomePage(),
  };

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: session.ready,
        builder: (context, snapshot) {
          Widget bodyWidget;

          if (snapshot.data == null) {
            bodyWidget = WaitingSession();
          } else if (session.isLogged()) {
            bodyWidget = HomePage();
          } else {
            bodyWidget = LoginPage();
          }

          return MaterialApp(
            title: 'Obah',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.lightBlue,
              fontFamily: 'Nunito',
            ),
            home: bodyWidget,
            routes: routes,
          );
        });
  }
}
