import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum ClientType {
  company('company', 'Company'),
  person('person', 'Person');

  final String value;
  final String label;

  const ClientType(this.value, this.label);
}
