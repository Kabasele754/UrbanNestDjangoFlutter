class User {
  final String id;
  final String username;
  final String email;
  final String phoneNumber;
  final String bio;

  User({
    required this.id,
    required this.username,
    required this.email,
    this.phoneNumber = '',
    this.bio = '',
  });

  factory User.fromJson(Map json) {
    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      phoneNumber: json['phone_number'] ?? '',
      bio: json['bio'] ?? '',
    );
  }

  Map toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'phone_number': phoneNumber,
      'bio': bio,
    };
  }
}