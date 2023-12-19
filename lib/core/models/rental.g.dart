// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rental.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rental _$RentalFromJson(Map<String, dynamic> json) => Rental(
      id: json['id'] as String?,
      client: json['client'] as String?,
      dumpster: json['dumpster'] as String?,
      street: json['street'] as String?,
      number: json['number'] as String?,
      neighborhood: json['neighborhood'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      zipCode: json['zipCode'] as String?,
      rentalDate: json['rentalDate'] as String?,
      pickUpDate: json['pickUpDate'] as String?,
    )
      ..price = (json['price'] as num?)?.toDouble()
      ..createdAt = json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String);

Map<String, dynamic> _$RentalToJson(Rental instance) => <String, dynamic>{
      'id': instance.id,
      'client': instance.client,
      'dumpster': instance.dumpster,
      'street': instance.street,
      'number': instance.number,
      'neighborhood': instance.neighborhood,
      'city': instance.city,
      'state': instance.state,
      'zipCode': instance.zipCode,
      'rentalDate': instance.rentalDate,
      'pickUpDate': instance.pickUpDate,
      'price': instance.price,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
