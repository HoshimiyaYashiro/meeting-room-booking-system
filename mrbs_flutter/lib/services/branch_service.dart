import 'package:directus/directus.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:mrbs_flutter/models/branch.dart';

class BranchService extends GetConnect {
  final DirectusCore sdk = DirectusCoreSingleton.instance;
  final logger = Logger();

  Future<List<Branch>?> fetchBranches() async {
    try {
      final DirectusResponse<List<dynamic>> response =  await sdk.items('branches').readMany();      
      return response.data.map((item) => Branch.fromJson(item)).toList();
    } catch (e) {
      logger.e(e);
      return null;
    }
  }
}
