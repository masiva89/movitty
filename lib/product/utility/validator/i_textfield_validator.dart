import 'package:flutter/material.dart';

abstract class ITextFieldValidator {
  String get textController;
  void validate();
  Widget? get alertWidget;
  //Widget get errorWidget;
  void onUpdate(String value);
}
