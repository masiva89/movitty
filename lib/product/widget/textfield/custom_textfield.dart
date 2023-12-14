// ignore_for_file: inference_failure_on_function_return_type

import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

/// Project custom textfield.
class _CustomTextfield extends StatefulWidget {
  /// Project custom textfield constructor.
  const _CustomTextfield({
    required this.isPassword,
    required this.controller,
    this.prefixIcon,
    this.focusNode,
    this.label,
    this.hintText,
    this.onChanged,
    this.textInputAction,
    this.keyboardType,
  });

  final SvgGenImage? prefixIcon;
  final bool isPassword;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String? label;
  final String? hintText;
  final Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;

  @override
  State<_CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<_CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
