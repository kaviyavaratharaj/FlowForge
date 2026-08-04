import 'package:flutter/material.dart';

import 'package:flowforge/shared/widgets/textfields/app_text_field.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? label;
  final String? hint;
  final String? Function(String?)? validator;

  const PasswordField({super.key,
    this.controller,
    this.focusNode,
    this.label,
    this.hint,
    this.validator,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      label: widget.label,
      hint: widget.hint,
      validator: widget.validator,

      obscureText: _obscurePassword,

      prefixIcon: Icons.lock_outline,

      suffixIcon: IconButton(
          onPressed: (){
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
          icon: Icon(
            _obscurePassword
               ? Icons.visibility_off_outlined
                : Icons.visibility_outlined
          )),
    );
  }
}
