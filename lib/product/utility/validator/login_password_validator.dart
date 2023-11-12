import 'package:flutter/material.dart';
import 'package:movitty/product/utility/constants/decoration/enums/field_validator_result.dart';
import 'package:movitty/product/utility/validator/i_textfield_validator.dart';
import 'package:movitty/product/widget/alert/text_field_alert.dart';

class LoginPasswordValidator extends ITextFieldValidator {
  LoginPasswordValidator(this.content);
  final String _errorMessage =
      'Password must be at least 8 characters long, contain at least one uppercase letter, one lowercase letter, one number and one special character.';
  final String _successMessage = 'Password is valid.';
  final String _pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~.]).{8,}$';
  String content;

  @override
  String get textController => content;

  Widget? _alertWidget;
  @override
  Widget? get alertWidget => _alertWidget;
  set alertWidget(Widget? value) => _alertWidget = value;

  @override
  void validate() {
    final regExp = RegExp(_pattern);
    if (content.isEmpty) {
      alertWidget = null;
    } else if (regExp.hasMatch(content)) {
      print('valid');
      alertWidget = TextFieldAlert(
        content: _successMessage,
        result: FieldValidatorResult.success,
      );
    } else {
      alertWidget = TextFieldAlert(
        content: _errorMessage,
        result: FieldValidatorResult.failure,
      );
    }
  }

  @override
  void onUpdate(String value) {
    print('onUpdate');
    content = value;
    if (alertWidget != null) {
      validate();
    }
  }
}
