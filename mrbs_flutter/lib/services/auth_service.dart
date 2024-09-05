import 'package:get/get_connect/connect.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:global_configuration/global_configuration.dart';

import '../models/auth_token.dart';

class AuthService extends GetConnect {
  final String apiUrl = '${GlobalConfiguration().getValue('CMS_API_URL')}/api/users/';

  Future<MeAuth?> fetchLogin(String email, String password) async {
    final body = {"email": email, "password": password};
    print(apiUrl);
    final response = await post('$apiUrl/login', body);
    if (response.statusCode == HttpStatus.ok) {
      try {
        print(response.body);
        final MeAuth meAuth = MeAuth.fromJson(response.body);
        return meAuth;
      } catch (e) {
        print(e);
        return null;
      }
    } else {
      return null;
    }
  }
}
