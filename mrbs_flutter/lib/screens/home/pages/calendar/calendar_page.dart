import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrbs_flutter/controller/screen_controller.dart';


class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CalendarPage')),
      body: Center(
        child: Text(Get.find<DashboardController>().title.value),
      ),
    );
  }
}