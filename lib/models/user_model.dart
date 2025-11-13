class UserModel {
  static const String collectionName = "Users";
  static UserModel? currentUser;
  String id;
  String name;
  String email;
  UserModel({required this.id, required this.name, required this.email});

  /// Function of json must be return userModel
  UserModel.fromJson(Map<String, dynamic> json)
    : this(id: json["id"], name: json["name"], email: json["email"]);

  Map<String, dynamic> toJson() => {
    /// key اسمو id
    /// هياخد ال object اللى ندة ال method
    "id": id,
    "name": name,
    "email": email,
  };
}
