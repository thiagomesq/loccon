// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Client _$ClientFromJson(Map<String, dynamic> json) => Client(
      company: json['company'] as String?,
      name: json['name'] as String?,
      usdot: json['usdot'] as String?,
      ssn: json['ssn'] as String?,
      phone: json['phone'] as String?,
      contact: json['contact'] as String?,
    )..id = json['id'] as String?;

Map<String, dynamic> _$ClientToJson(Client instance) => <String, dynamic>{
      'id': instance.id,
      'company': instance.company,
      'name': instance.name,
      'usdot': instance.usdot,
      'ssn': instance.ssn,
      'phone': instance.phone,
      'contact': instance.contact,
    };
