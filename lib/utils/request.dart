import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:obah_mobile/utils/user-session.dart';

String _baseUrl =
    "http://obahapi-env.kpz2ejwur2.us-east-1.elasticbeanstalk.com";
// String _baseUrl = "http://192.168.1.5:5000";

_getUri(endpoint) {
  return [_baseUrl, endpoint].join('');
}

_getHeaders() {
  Map<String, String> headers = new Map<String, String>();

  headers["Access-Control-Allow-Origin"] = "*";
  headers["Accept"] = "application/json";
  headers["Content-Type"] = "application/json";
  if (UserSession().isLogged()) {
    String token = UserSession().getSession().token;
    headers["Authorization"] = "Bearer $token";
  }

  return headers;
}

_getBody(data) {
  return json.encode(data);
}

Future<http.Response> get(String endpoint, dynamic params) {
  return http.get(
    _getUri(endpoint),
    headers: _getHeaders(),
  );
}

Future<http.Response> post(String endpoint, Map<String, String> params) {
  return http.post(
    _getUri(endpoint),
    body: _getBody(params),
    headers: _getHeaders(),
  );
}

Future<http.Response> put(String endpoint, dynamic params) {
  return http.put(
    _getUri(endpoint),
    body: _getBody(params),
    headers: _getHeaders(),
  );
}

Future<http.Response> delete(String endpoint, dynamic params) {
  return http.put(
    _getUri(endpoint),
    headers: _getHeaders(),
  );
}
