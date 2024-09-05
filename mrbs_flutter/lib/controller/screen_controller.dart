import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/home/pages/calendar/calendar_page.dart';
import '../screens/home/pages/dashboard/dashboard_page.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  var currentIndex = 0.obs;

  final pages = <String>['/dashboard', '/webview'];

  void changePage(int index) {
    currentIndex.value = index;
    Get.toNamed(pages[index], id: 1);
  }

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/dashboard') {
      return GetPageRoute(
        settings: settings,
        page: () => const DashboardPage(),
        binding: DashboardBinding(),
      );
    }
    if (settings.name == '/webview') {
      return GetPageRoute(
        settings: settings,
        page: () => const CalendarPage(),
        binding: CalendarBinding(),
      );
    }
    return null;
  }
}

class DashboardController extends GetxController {
  final title = 'Dashboard'.obs;
}

class CalendarController extends GetxController {
  final title = 'Calendar'.obs;
}

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
  }
}

class CalendarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CalendarController());
  }
}
