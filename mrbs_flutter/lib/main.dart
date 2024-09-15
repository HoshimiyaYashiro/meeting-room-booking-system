import 'package:directus/directus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mrbs_flutter/controller/auth_controller.dart';
import 'package:mrbs_flutter/controller/branch_controller.dart';
import 'package:mrbs_flutter/controller/user_controller.dart';

import 'controller/screen_controller.dart';
import 'middlewares/auth_middleware.dart';
import 'screens/home/home_screen.dart';
import 'screens/login/login_screen.dart';
import 'utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GlobalConfiguration().loadFromAsset("app_settings.json");
  await GetStorage.init();
  await DirectusCoreSingleton.init(GlobalConfiguration().getValue('CMS_API_URL'), storage: SharedPreferencesStorage());
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  
  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    Get.put(BranchController());
    Get.put(UserController());
    return GetMaterialApp(
      getPages: [
        GetPage(name: '/login', page: () => const LoginScreen(), middlewares: [AuthMiddleware()]),
        GetPage(name: '/home', page: () => const HomeScreen(), middlewares: [AuthMiddleware()], binding: HomeBinding()),
      ],
      debugShowCheckedModeBanner: false,
      title: 'NTT Data VDS MRBS',
      theme: ThemeData(
          useMaterial3: true,
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              foregroundColor: Colors.white,
              backgroundColor: kPrimaryColor,
              shape: const StadiumBorder(),
              maximumSize: const Size(double.infinity, 56),
              minimumSize: const Size(double.infinity, 56),
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: kPrimaryLightColor,
            contentPadding: EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide.none,
            ),
          ),
      ),
      initialRoute: '/home',
      
    );
  }
}