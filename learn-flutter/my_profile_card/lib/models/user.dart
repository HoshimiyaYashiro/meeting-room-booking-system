class UserBase {
  final String email;
  UserBase({
    required this.email,
  });
}

class User extends UserBase {
  final String fullName;
  final String jobTitle;
  late final String avatarUrl;
  User({
    required super.email,
    required this.fullName,
    required this.jobTitle,
  });
}