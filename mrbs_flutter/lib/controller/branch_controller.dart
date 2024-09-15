import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../models/branch.dart';
import '../services/branch_service.dart';

class BranchController extends GetxController {
  final BranchService _branchService = Get.put(BranchService());

  final logger = Logger();

  final branches = Rxn<List<Branch>>();

  final selectedBranchId = ''.obs;

  fetchInitialData() async {
    branches.value = await _branchService.fetchBranches();
    selectedBranchId.value = branches.value!.first.id!;
  }
}
