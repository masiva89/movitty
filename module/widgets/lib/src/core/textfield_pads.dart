import 'package:flutter/material.dart';

/// TextFieldPads is a class that contains the padding values for the custom textfield.
class TextFieldSizes {
  /// TextFieldPads constructor.
  TextFieldSizes({
    this.fontSize,
    this.height,
    this.width,
    this.iconSize,
    this.padding,
    this.radius,
  }) {
    print('TextFieldPads init');
  }

  /// TextField's font size.
  final double? fontSize;

  /// TextField's height.
  final double? height;

  /// TextField's width.
  final double? width;

  /// TextField's icon size.
  final double? iconSize;

  /// TextField's padding.
  final EdgeInsets? padding;

  /// TextField's border radius.
  final double? radius;
}
