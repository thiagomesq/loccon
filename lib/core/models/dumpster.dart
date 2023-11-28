import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'dumpster.g.dart';

@JsonSerializable()
class Dumpster {
  String? id;
  String? code;
  int? size;
  bool isRented;

  Dumpster({
    this.code,
    this.size,
    this.isRented = false,
  }) : id = const Uuid().v4();

  factory Dumpster.fromJson(Map<String, dynamic> json) =>
      _$DumpsterFromJson(json);

  Map<String, dynamic> toJson() => _$DumpsterToJson(this);
}
