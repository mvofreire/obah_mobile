import 'package:flutter/material.dart';
import 'package:obah_mobile/utils/user-session.dart';
import 'pages/home.dart';
import 'pages/login.dart';

void main() => runApp(MyApp());

class WaitingSession extends StatelessWidget {
  static String tag = 'waiting-page';

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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: session.ready,
      builder: (context, snapshot) {
        Widget _home;
        if (snapshot.data == null) {
          _home = WaitingSession();
        } else if (session.isLogged()) {
          _home = HomePage();
        } else {
          _home = LoginPage();
        }

        return MaterialApp(
          title: 'Obah',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.lightBlue,
            fontFamily: 'Nunito',
          ),
          home: _home,
          routes: {
            LoginPage.tag: (context) => LoginPage(),
            HomePage.tag: (context) => HomePage(),
          },
        );
      },
    );
  }
}
