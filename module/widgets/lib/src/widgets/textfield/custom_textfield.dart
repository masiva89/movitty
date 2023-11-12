import 'package:flutter/material.dart';
import 'package:widgets/src/core/textfield_pads.dart';

/// Project custom textfield.
class CustomTextfield extends StatefulWidget {
  /// Project custom textfield constructor.
  const CustomTextfield({
    required this.isPassword,
    required this.controller,
    required this.label,
    required this.hintText,
    super.key,
    this.prefixIcon,
    this.focusNode,
    this.onChanged,
    this.textInputAction,
    this.keyboardType,
    required this.primaryColor,
    required this.secondaryColor,
    required this.tertiaryColor,
    required this.pads,
    required this.textStyle,
    required this.hintStyle,
    required this.labelStyle,
  });

  final Widget? prefixIcon;
  final bool isPassword;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String label;
  final String hintText;
  final Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final Color primaryColor;
  final Color secondaryColor;
  final Color tertiaryColor;
  final TextFieldSizes pads;
  final TextStyle textStyle;
  final TextStyle hintStyle;
  final TextStyle labelStyle;

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  late TextEditingController _controller = TextEditingController();
  late bool _isObscure = true;

  late FocusNode? _focusNode;
  late bool _isPassword;
  late String _label;
  late String _hintText;
  late Function(String)? _onChanged;
  late TextInputAction? _textInputAction;
  late TextInputType? _keyboardType;
  late Widget? _prefixIcon;
  late Color _primaryColor;
  late Color _secondaryColor;
  late Color _tertiaryColor;
  late TextFieldSizes _pads;
  late TextStyle _textStyle;
  late TextStyle _hintStyle;
  late TextStyle _labelStyle;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    _isPassword = widget.isPassword;
    _label = widget.label;
    _hintText = widget.hintText;
    _onChanged = widget.onChanged;
    _textInputAction = widget.textInputAction;
    _keyboardType = widget.keyboardType;
    _prefixIcon = widget.prefixIcon;
    _focusNode = widget.focusNode;
    _primaryColor = widget.primaryColor;
    _secondaryColor = widget.secondaryColor;
    _tertiaryColor = widget.tertiaryColor;
    _pads = widget.pads;
    _textStyle = widget.textStyle;
    _hintStyle = widget.hintStyle;
    _labelStyle = widget.labelStyle;
  }

  @override
  void didUpdateWidget(covariant CustomTextfield oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      _controller = widget.controller;
    }
    if (oldWidget.hintText != widget.hintText) {
      _hintText = widget.hintText;
    }
    if (oldWidget.label != widget.label) {
      _label = widget.label;
    }
    if (oldWidget.textInputAction != widget.textInputAction) {
      _textInputAction = widget.textInputAction;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: _primaryColor,
      onChanged: _onChanged,
      controller: widget.controller,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        hintText: widget.hintText,
        contentPadding: _pads.padding,
        prefixIcon: _prefixIcon,
        prefixIconColor: _tertiaryColor,
        filled: true,
        fillColor: _secondaryColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_pads.radius ?? 20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: _primaryColor),
          borderRadius: BorderRadius.circular(_pads.radius ?? 20),
        ),
      ),
    );
  }
}
