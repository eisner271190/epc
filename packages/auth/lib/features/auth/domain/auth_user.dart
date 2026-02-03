/// Simple POJO replacement for generated Freezed model to fix broken codegen
class AuthUser {
  final String id;
  final String? email;
  final String? name;
  final String? picture;

  const AuthUser({required this.id, this.email, this.name, this.picture});

  factory AuthUser.fromJson(Map<String, dynamic> json) {
    return AuthUser(
      id: json['id'] as String,
      email: json['email'] as String?,
      name: json['name'] as String?,
      picture: json['picture'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'name': name,
    'picture': picture,
  };

  AuthUser copyWith({
    String? id,
    String? email,
    String? name,
    String? picture,
  }) {
    return AuthUser(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      picture: picture ?? this.picture,
    );
  }
}
