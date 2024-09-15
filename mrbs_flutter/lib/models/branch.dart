import 'package:mrbs_flutter/models/mixin.dart';

class BranchBase {
  late final String name;

  BranchBase({required this.name});
}

class BranchCreate extends BranchBase {
  late final String? address;
  late final String? description;
  BranchCreate({
    required super.name,
    this.address,
    this.description,
  });
}

class Branch extends BranchCreate with ItemAuthor, ItemDate {
  final String id;

  Branch({
    required this.id,
    required super.name,
    super.address,
    super.description
  });

  factory Branch.fromJson(Map<String, dynamic> json) {
    Branch branch = Branch(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      description: json['description']
    );
    branch.user_created = json['user_created'];
    branch.user_updated = json['user_updated'];
    branch.date_created = DateTime.parse(json['date_created']);
    branch.date_updated = json['date_updated'] != null ? DateTime.parse(json['date_updated']) : null;
    return branch;
  }
}
