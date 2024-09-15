import 'package:directus/directus.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class UserService extends GetConnect {
  final DirectusCore sdk = DirectusCoreSingleton.instance;
  final logger = Logger();

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
