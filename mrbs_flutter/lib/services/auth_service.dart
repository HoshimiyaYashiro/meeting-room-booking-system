import 'package:directus/directus.dart';
import 'package:get/get.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:logger/logger.dart';

class AuthService extends GetConnect {
  final String apiUrl = '${GlobalConfiguration().getValue('CMS_API_URL')}/api/users/';
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

  Future<DirectusUser?> getCurrentUser() async {
    try {
      final DirectusResponse<DirectusUser>? response =  await sdk.auth.currentUser?.read();
      return response?.data;
    } catch (e) {
      logger.e(e);
      return null;
    }
  }
}
