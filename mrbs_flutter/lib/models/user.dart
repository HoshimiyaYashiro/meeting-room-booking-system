class UserBase {
  late final String email;
  UserBase({
    required this.email,
  });
}

class UserCreate extends UserBase {
  late final String password;
  UserCreate({
    required super.email,
    required this.password,
  });
}

class User extends UserBase {
  final String id;
  // late final String? firstName;
  // late final String? lastName;
  // late final String? phoneNumber;
  // late final String? country;
  User({
    required this.id,
    required super.email
  });

  factory User.fromJson(Map<String, dynamic> json) {
    User user = User(
      id: json['id'],
      email: json['email'],
    );
    return user;
  }

  
}
