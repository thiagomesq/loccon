import 'package:json_annotation/json_annotation.dart';

part 'prices.g.dart';

@JsonSerializable()
class Prices {
  String? id;
  Map<String, double>? initialRentalPrice;
  double? additionalPricePerDay;

  Prices({
    this.initialRentalPrice,
    this.additionalPricePerDay,
  });

  factory Prices.fromJson(Map<String, dynamic> json) => _$PricesFromJson(json);

  Map<String, dynamic> toJson() => _$PricesToJson(this);
}
