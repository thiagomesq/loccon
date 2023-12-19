import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'client.g.dart';

@JsonSerializable()
class Client {
  String? id;
  String? company;
  String? name;
  String? email;
  String? phone;
  String? businessPhone;
  DateTime? createdAt;

  Client({
    this.company,
    this.name,
    this.email,
    this.phone,
    this.businessPhone,
  }) {
    createdAt = DateTime.now();
    id = id ?? const Uuid().v4();
  }

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);

  Map<String, dynamic> toJson() => _$ClientToJson(this);
}
