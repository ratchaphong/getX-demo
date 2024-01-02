import 'package:json_annotation/json_annotation.dart';
// flutter packages pub run build_runner build --delete-conflicting-outputs

part 'user_model.g.dart';

@JsonSerializable()
class User {
  final String username;
  final String password;
  final int id;

  User(this.username, this.password, this.id);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
