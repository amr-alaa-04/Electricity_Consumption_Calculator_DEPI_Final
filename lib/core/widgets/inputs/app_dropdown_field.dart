import 'package:flutter/material.dart';

import 'app_input_decoration.dart';

/// Generic select field that participates in Flutter forms and validation.
class AppDropdownField<T> extends StatefulWidget {
  const AppDropdownField({
    required this.items,
    this.value,
    this.labelText,
    this.hintText,
    this.validator,
    this.onChanged,
    this.enabled = true,
    this.menuMaxHeight = 320,
    super.key,
  });

  final List<DropdownMenuItem<T>> items;
  final T? value;
  final String? labelText;
  final String? hintText;
  final FormFieldValidator<T>? validator;
  final ValueChanged<T?>? onChanged;
  final bool enabled;
  final double menuMaxHeight;

  @override
  State<AppDropdownField<T>> createState() => _AppDropdownFieldState<T>();
}

class _AppDropdownFieldState<T> extends State<AppDropdownField<T>> {
  GlobalKey<FormFieldState<T>> _fieldKey = GlobalKey<FormFieldState<T>>();

  @override
  void didUpdateWidget(covariant AppDropdownField<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    final currentSelection = _fieldKey.currentState?.value;
    if (currentSelection != null &&
        widget.items.where((item) => item.value == currentSelection).length != 1) {
      // Reset FormField state so a removed selection cannot reach validation.
      _fieldKey = GlobalKey<FormFieldState<T>>();
    }
  }

  T? _normalizedInitialValue() {
    final value = widget.value;
    if (value == null) return null;
    return widget.items.where((item) => item.value == value).length == 1 ? value : null;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      key: _fieldKey,
      initialValue: _normalizedInitialValue(),
      items: widget.items,
      validator: widget.validator,
      onChanged: widget.enabled && widget.items.isNotEmpty ? widget.onChanged : null,
      isExpanded: true,
      menuMaxHeight: widget.menuMaxHeight,
      iconEnabledColor: Theme.of(context).colorScheme.primary,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: AppInputDecoration.build(
        context,
        labelText: widget.labelText,
        hintText: widget.hintText,
      ),
    );
  }
}
