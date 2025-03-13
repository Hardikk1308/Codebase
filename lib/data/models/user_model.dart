class UserModel {
  final String userId;
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String profilePicture;
  final List<String> roles;
  final Map<String, List<String>> classMappings;

  UserModel({
    required this.userId,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.profilePicture,
    required this.roles,
    required this.classMappings,
  });

  // Factory constructor to parse from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'] as String,
      username: json['username'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      profilePicture: json['profilePicture'] as String,
      roles: List<String>.from(json['roles'] as List),
      classMappings: (json['classMappings'] as Map<String, dynamic>)
          .map((key, value) => MapEntry(
        key,
        List<String>.from(value as List),
      )),
    );
  }

  // Convert the model back to JSON
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'profilePicture': profilePicture,
      'roles': roles,
      'classMappings': classMappings.map(
            (key, value) => MapEntry(key, value),
      ),
    };
  }
}
