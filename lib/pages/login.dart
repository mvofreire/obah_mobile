import 'package:flutter/material.dart';
import 'package:obah_mobile/services/auth.dart' as AuthService;
import 'package:obah_mobile/utils/user-identity.dart';
import 'package:obah_mobile/utils/user-session.dart';
import 'home.dart';
import 'package:toast/toast.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController(text: "vinny.freire@gmail.com");
  final passwordController = TextEditingController(text: "123123");
  final facebookLogin = FacebookLogin();

  void _onCLickFacebookLogin() async {
    final result = await facebookLogin.logInWithReadPermissions(['email']);
    print(result);
  }

  void onClickLogin(context) async {
    try {
      UserIdentity identity = await AuthService.makeLogin(
          emailController.text, passwordController.text);

      bool isLogged = await UserSession().setSession(identity);
      if (isLogged) {
        Navigator.pushReplacementNamed(context, HomePage.tag);
      }
    } on Exception catch (err) {
      Toast.show(err.toString(), context, duration: 5);
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      controller: emailController,
      decoration: InputDecoration(
        hintText: 'my.email@gmail.com',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () => onClickLogin(context),
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Log In', style: TextStyle(color: Colors.black)),
      ),
    );

    final loginFacebookButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: _onCLickFacebookLogin,
        padding: EdgeInsets.all(12),
        color: Colors.blue.shade900,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.branding_watermark),
            SizedBox(
              width: 10,
            ),
            Text(
              'Login with Facebook',
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            SizedBox(height: 48.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            loginButton,
            loginFacebookButton,
            forgotLabel
          ],
        ),
      ),
    );
  }
}
