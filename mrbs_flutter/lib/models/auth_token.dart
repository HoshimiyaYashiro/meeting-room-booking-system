
import 'user.dart';

class AuthToken {
  final String token;
  final int exp;

  AuthToken({
    required this.token,
    required this.exp,
  });

  factory AuthToken.fromJson(Map<String, dynamic> json) {
    return AuthToken(
      token: json['token'],
      exp: json['exp'],
    );
  }
}

class MeAuth {
  final User user;
  final AuthToken token;
  
  MeAuth({
    required this.user,
    required this.token,
  });

  factory MeAuth.fromJson(Map<String, dynamic> json) {
    return MeAuth(
      user: User.fromJson(json['user']),
      token: AuthToken(token: json['token'], exp: json['exp']),
    );
  }
}