import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'client.g.dart';

@JsonSerializable()
class Client {
  String? id;
  String? company;
  String? name;
  String? usdot;
  String? ssn;
  String? phone;
  String? contact;

  Client({
    this.company,
    this.name,
    this.usdot,
    this.ssn,
    this.phone,
    this.contact,
  }) : id = const Uuid().v4();

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);

  Map<String, dynamic> toJson() => _$ClientToJson(this);
}
