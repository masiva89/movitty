import 'package:flutter/material.dart';
import 'package:widgets/src/core/textfield_pads.dart';

/// Project custom textfield.
class TestCustomTextfield extends StatefulWidget {
  /// Project custom textfield constructor.
  const TestCustomTextfield({
    required this.isPassword,
    required this.controller,
    required this.label,
    required this.hintText,
    required this.primaryColor,
    required this.secondaryColor,
    required this.tertiaryColor,
    required this.pads,
    required this.textStyle,
    required this.hintStyle,
    required this.labelStyle,
    required this.isObscure,
    required this.errorWidget,
    super.key,
    this.prefixIcon,
    this.focusNode,
    this.onChanged,
    this.textInputAction,
    this.keyboardType,
    this.suffixIcon,
    this.onSubmitted,
  });

  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isPassword;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String label;
  final String hintText;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final Color primaryColor;
  final Color secondaryColor;
  final Color tertiaryColor;
  final TextFieldSizes pads;
  final TextStyle textStyle;
  final TextStyle hintStyle;
  final TextStyle labelStyle;
  final bool isObscure;
  final Widget? errorWidget;

  @override
  State<TestCustomTextfield> createState() => _TestCustomTextfieldState();
}

class _TestCustomTextfieldState extends State<TestCustomTextfield> {
  late TextEditingController _controller = TextEditingController();

  late FocusNode? _focusNode;
  late bool _isPassword;
  late String _label;
  late String _hintText;
  late Function(String)? _onChanged;
  late Function(String)? _onSubmitted;
  late TextInputAction? _textInputAction;
  late TextInputType? _keyboardType;
  late Widget? _prefixIcon;
  late Widget? _suffixIcon;
  late Color _primaryColor;
  late Color _secondaryColor;
  late Color _tertiaryColor;
  late TextFieldSizes _pads;
  late TextStyle _textStyle;
  late TextStyle _hintStyle;
  late TextStyle _labelStyle;
  late bool _isObscure;
  late Widget? _errorWidget;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    _isPassword = widget.isPassword;
    _label = widget.label;
    _hintText = widget.hintText;
    _onChanged = widget.onChanged;
    _onSubmitted = widget.onSubmitted;
    _textInputAction = widget.textInputAction;
    _keyboardType = widget.keyboardType;
    _prefixIcon = widget.prefixIcon;
    _suffixIcon = widget.suffixIcon;
    _focusNode = widget.focusNode;
    _primaryColor = widget.primaryColor;
    _secondaryColor = widget.secondaryColor;
    _tertiaryColor = widget.tertiaryColor;
    _pads = widget.pads;
    _textStyle = widget.textStyle;
    _hintStyle = widget.hintStyle;
    _labelStyle = widget.labelStyle;
    _isObscure = widget.isObscure;
    _errorWidget = widget.errorWidget;
  }

  @override
  void didUpdateWidget(covariant TestCustomTextfield oldWidget) {
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
    if (oldWidget.isObscure != widget.isObscure) {
      _isObscure = widget.isObscure;
    }
    if (oldWidget.errorWidget != widget.errorWidget) {
      _errorWidget = widget.errorWidget;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: _primaryColor,
      onChanged: _onChanged,
      onSubmitted: _onSubmitted,
      controller: widget.controller,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      obscureText: _isObscure,
      style: _textStyle,
      focusNode: _focusNode,
      decoration: InputDecoration(
        error: _errorWidget,
        hintText: widget.hintText,
        hintStyle: _hintStyle,
        contentPadding: _pads.padding,
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: _pads.padding?.left ?? 0),
          child: _prefixIcon,
        ),
        prefixIconColor: _tertiaryColor,
        prefixIconConstraints: BoxConstraints(
          minWidth: _pads.iconSize ?? 0,
        ),
        suffixIconColor: _primaryColor,
        suffixIcon: _isPassword
            ? Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: _pads.padding?.left ?? 0),
                child: _suffixIcon,
              )
            : null,
        constraints: BoxConstraints(
          minHeight: _pads.iconSize ?? 0,
        ),
        filled: true,
        fillColor: _secondaryColor,
        label: Text(
          _label,
          style: _labelStyle,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
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
