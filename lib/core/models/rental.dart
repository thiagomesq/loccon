import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'rental.g.dart';

@JsonSerializable()
class Rental {
  String? id;
  String? client;
  String? dumpster;
  String? street;
  String? number;
  String? neighborhood;
  String? city;
  String? state;
  String? zipCode;
  String? rentalDate;
  String? retrievalDate;
  double? price;
  DateTime? createdAt;

  Rental({
    this.id,
    this.client,
    this.dumpster,
    this.street,
    this.number,
    this.neighborhood,
    this.city,
    this.state,
    this.zipCode,
    this.rentalDate,
    this.retrievalDate,
  }) {
    createdAt = DateTime.now();
    id = id ?? const Uuid().v4();
  }

  factory Rental.fromJson(Map<String, dynamic> json) => _$RentalFromJson(json);

  Map<String, dynamic> toJson() => _$RentalToJson(this);
}
