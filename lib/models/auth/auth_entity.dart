class AuthEntity {
  final int id;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;
  final String phone;
  final String password;
  final String username;

  AuthEntity({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.phone,
    required this.password,
    required this.username,
  });

  factory AuthEntity.fromJson(Map<String, dynamic> json) {
    return AuthEntity(
      id: json["ID"],
      createdAt: json["CreatedAt"],
      updatedAt: json["UpdatedAt"],
      deletedAt: json["DeletedAt"],
      phone: json["Phone"],
      password: json["Password"],
      username: json["Username"],
    );
  }
}
