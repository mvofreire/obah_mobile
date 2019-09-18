class UserIdentity {
  final String id;
  final String name;
  final String token;
  final String email;
  final String refreshToken;

  UserIdentity(this.id, this.name, this.token, this.email, this.refreshToken);

  UserIdentity.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        email = json['email'],
        token = json['token'],
        refreshToken = json['refreshToken'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'token': token,
        'refreshToken': refreshToken,
      };

  @override
  String toString() {
    return "${toJson()}";
  }
}
