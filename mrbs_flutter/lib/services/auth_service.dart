import 'package:directus/directus.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class AuthService extends GetConnect {
  final DirectusCore sdk = DirectusCoreSingleton.instance;
  final logger = Logger();

  get isLoggedIn {
    return sdk.auth.isLoggedIn;
  }

  Future<void> login(String email, String password) async {
    try {
      await sdk.auth.login(email: email, password: password);
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> logout() async {
    try {
      await sdk.auth.logout();
    } catch (e) {
      logger.e(e);
    }
  }
}
