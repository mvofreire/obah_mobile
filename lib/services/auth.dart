import 'dart:convert' as convert;
import 'package:obah_mobile/utils/request.dart' as Request;
import 'package:obah_mobile/utils/user-identity.dart';

Future<UserIdentity> makeLogin(String username, String password) async {
  var response = await Request.post("/login", {
    "email": username,
    "password": password,
  });

  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    return UserIdentity.fromJson(jsonResponse);
  } else {
    throw new Exception(response.body);
  }
}
