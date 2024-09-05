class RoleBase {
  late final String id;
}

class RoleCreate extends RoleBase {
  late final String? name;
  late final String? description;
  RoleCreate({
    required id,
    required this.name,
    required this.description,
  });
}

class Role extends RoleBase {
  late final String createdAt;
  late final String updatedAt;
  Role({
    required id,
    required name,
    required description
  });

  factory Role.fromJson(Map<String, dynamic> json) {
    Role role = Role(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
    role.createdAt = json['createdAt'];
    role.updatedAt = json['updatedAt'];
    return role;
  }
}