import 'package:flutter/material.dart';
import 'package:movitty/main.dart';

/// Material gesture mixin for [Movitty]
///
/// Mixin contains a [GestureDetector] callback to close keyboard
/// when user tap outside of text field.
mixin MaterialGestureMixin on StatelessWidget {
  /// Gesture handler for [GestureDetector].
  ///
  /// This method will close keyboard when user tap outside of text field.
  void unFocusAll(BuildContext context) {
    final currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
  }
}
