// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prices.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Prices _$PricesFromJson(Map<String, dynamic> json) => Prices(
      initialRentalPrice:
          (json['initialRentalPrice'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      additionalPricePerDay:
          (json['additionalPricePerDay'] as num?)?.toDouble(),
    )..id = json['id'] as String?;

Map<String, dynamic> _$PricesToJson(Prices instance) => <String, dynamic>{
      'id': instance.id,
      'initialRentalPrice': instance.initialRentalPrice,
      'additionalPricePerDay': instance.additionalPricePerDay,
    };
