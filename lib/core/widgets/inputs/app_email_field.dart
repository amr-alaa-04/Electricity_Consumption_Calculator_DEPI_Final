import 'package:flutter/material.dart';

import 'app_text_field.dart';

/// Email-oriented text field; provide validation through [validator].
class AppEmailField extends StatelessWidget {
  const AppEmailField({
    this.controller,
    this.focusNode,
    this.labelText,
    this.hintText = 'name@example.com',
    this.validator,
    this.onChanged,
    this.enabled = true,
    super.key,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? labelText;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      focusNode: focusNode,
      labelText: labelText,
      hintText: hintText,
      validator: validator,
      onChanged: onChanged,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      autofillHints: const [AutofillHints.email],
      textDirection: TextDirection.ltr,
      autocorrect: false,
      enabled: enabled,
    );
  }
}
