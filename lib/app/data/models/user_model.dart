class UserModel {
  final String uId;
  final String name;
  final String email;

  UserModel({
    required this.uId,
    required this.name,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uId: json["uId"] ?? '',
        name: json["name"] ?? '',
        email: json["email"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "uId": uId,
        "name": name,
        "email": email,
      };
}
