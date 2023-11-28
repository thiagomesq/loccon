// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lc_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LCUser _$LCUserFromJson(Map<String, dynamic> json) => LCUser(
      id: json['id'] as String?,
      username: json['username'] as String?,
      type: $enumDecodeNullable(_$UserTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$LCUserToJson(LCUser instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'type': _$UserTypeEnumMap[instance.type],
    };

const _$UserTypeEnumMap = {
  UserType.admin: 'admin',
  UserType.user: 'user',
};
