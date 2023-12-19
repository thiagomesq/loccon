// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Client _$ClientFromJson(Map<String, dynamic> json) => Client(
      company: json['company'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      businessPhone: json['businessPhone'] as String?,
    )
      ..id = json['id'] as String?
      ..createdAt = json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String);

Map<String, dynamic> _$ClientToJson(Client instance) => <String, dynamic>{
      'id': instance.id,
      'company': instance.company,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'businessPhone': instance.businessPhone,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
