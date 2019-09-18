import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:obah_mobile/utils/user-identity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSession {
  static UserSession _instance;

  ValueNotifier<Error> onError;
  SharedPreferences session;
  Future<bool> ready;

  factory UserSession() {
    _instance ??= UserSession._internal();
    return _instance;
  }

  UserSession._internal() {
    onError = new ValueNotifier(null);
    ready = new Future<bool>(() async {
      try {
        this.session = await SharedPreferences.getInstance();
      } on Error catch (e) {
        onError.value = e;
      }
      return true;
    });
  }

  bool isLogged() {
    bool _hasKey = session.containsKey('user_session');
    return _hasKey;
  }

  Future<bool> setSession(UserIdentity data) {
    if (data == null) {
      return Future.value(false);
    }

    return session.setString('user_session', data.toString());
  }

  UserIdentity getSession() {
    String _identity = session.getString('user_session');
    UserIdentity identity = UserIdentity.fromJson(json.decode(_identity));

    return identity;
  }

  Future<bool> removeSession() {
    return session.remove('user_session');
  }
}
