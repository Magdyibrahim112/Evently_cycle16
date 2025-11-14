import 'package:evently_app_online/models/event_model.dart';

class UserModel {
  static const String collectionName = "Users";
  static UserModel? currentUser;
  String id;
  String name;
  String email;
  List<String> favouriteEventIds;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.favouriteEventIds,
  });

  /// Function of json must be return userModel
  UserModel.fromJson(Map<String, dynamic> json)
    : this(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        favouriteEventIds: (json["favouriteEventsIds"] as List<dynamic>)
            .map((obj) => obj.toString())
            .toList(),
      );

  Map<String, dynamic> toJson() => {
    /// key اسمو id
    /// هياخد ال object اللى ندة ال method
    "id": id,
    "name": name,
    "email": email,
    "favouriteEventsIds": favouriteEventIds,
  };
}
