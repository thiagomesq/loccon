import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum UserType {
  admin('admin', 'Admin'),
  user('user', 'User');

  final String value;
  final String label;

  const UserType(this.value, this.label);
}
