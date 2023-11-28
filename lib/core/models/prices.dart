import 'package:json_annotation/json_annotation.dart';

part 'prices.g.dart';

@JsonSerializable()
class Prices {
  String? id;
  double? weeklyPrice;
  double? additionalPricePerDay;

  Prices({
    this.weeklyPrice,
    this.additionalPricePerDay,
  });

  factory Prices.fromJson(Map<String, dynamic> json) => _$PricesFromJson(json);

  Map<String, dynamic> toJson() => _$PricesToJson(this);
}
