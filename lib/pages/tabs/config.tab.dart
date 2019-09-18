import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:obah_mobile/pages/login.dart';
import 'package:obah_mobile/utils/user-session.dart';

class ConfigTab extends StatelessWidget {
  void _onClickLogout(BuildContext context) async {
    try {
      UserSession session = UserSession();
      bool wasRemoved = await session.removeSession();
      if (wasRemoved) {
        //send to login
        Navigator.pushReplacementNamed(context, LoginPage.tag);
      }
    } on Exception catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: RaisedButton(
        color: Colors.red.shade800,
        child: Text(
          "Deslogar Aplicativo",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () => _onClickLogout(context),
      ),
    );
  }
}
