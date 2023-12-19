import 'package:json_annotation/json_annotation.dart';
import 'package:dumpin/core/enums/user_type.dart';

part 'lc_user.g.dart';

@JsonSerializable()
class LCUser {
  String? id;
  String? username;
  UserType? type;

  LCUser({
    this.id,
    this.username,
    this.type,
  });

  factory LCUser.fromJson(Map<String, dynamic> json) => _$LCUserFromJson(json);

  Map<String, dynamic> toJson() => _$LCUserToJson(this);
}
