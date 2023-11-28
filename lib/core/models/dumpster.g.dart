// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dumpster.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dumpster _$DumpsterFromJson(Map<String, dynamic> json) => Dumpster(
      code: json['code'] as String?,
      size: json['size'] as int?,
      isRented: json['isRented'] as bool? ?? false,
    )..id = json['id'] as String?;

Map<String, dynamic> _$DumpsterToJson(Dumpster instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'size': instance.size,
      'isRented': instance.isRented,
    };
