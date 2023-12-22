import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class LCTypeAheadField<T> extends StatefulWidget {
  final String? labelText;
  final void Function(String value)? onChanged;
  final String? initialValue;
  final void Function(T) onSuggestionSelected;
  final Widget Function(BuildContext, T) itemBuilder;
  final FutureOr<List<T>> Function(String) suggestionsCallback;
  const LCTypeAheadField({
    Key? key,
    this.labelText,
    this.onChanged,
    this.initialValue,
    required this.onSuggestionSelected,
    required this.itemBuilder,
    required this.suggestionsCallback,
  }) : super(key: key);

  @override
  State<LCTypeAheadField<T>> createState() => _LCTypeAheadFieldState<T>();
}

class _LCTypeAheadFieldState<T> extends State<LCTypeAheadField<T>> {
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: widget.initialValue);

    return TypeAheadField<T>(
      controller: controller,
      builder: (context, controller, focusNode) {
        return TextField(
          controller: controller,
          focusNode: focusNode,
          decoration: InputDecoration(
            labelText: widget.labelText,
            filled: true,
            fillColor: Theme.of(context).colorScheme.background,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
          ),
          onChanged: widget.onChanged,
        );
      },
      onSelected: widget.onSuggestionSelected,
      itemBuilder: widget.itemBuilder,
      suggestionsCallback: widget.suggestionsCallback,
    );
  }
}
