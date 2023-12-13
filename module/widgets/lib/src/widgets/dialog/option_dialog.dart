import 'package:flutter/material.dart';
import 'package:widgets/src/core/dialog_base.dart';

/// A dialog that presents options to the user and returns a boolean value
/// based on the user's selection.
///
/// The [OptionDialog] is a [StatefulWidget] that displays a dialog with
/// a title, a message, and two action buttons: close and check. The user can
/// select either the close button or the check button, and the dialog will
/// return a boolean value indicating the user's selection. If the user selects
/// the close button, the dialog will return `false`. If the user selects the
/// check button, the dialog will return `true`.
///
/// To show the [OptionDialog], use the static method [OptionDialog.show] and
/// provide the required parameters: [title], [message], and [context].
/// The [OptionDialog.show] method will return a [Future<bool?>]
/// that represents the user's selection.
///
/// Example usage:
/// ```dart
/// bool? result = await OptionDialog.show(
///   title: 'Confirmation',
///   message: 'Are you sure you want to proceed?',
///   context: context,
/// );
/// if (result == true) {
///   // User selected the check button
///   // Proceed with the desired action
/// } else {
///   // User selected the close button or dismissed the dialog
///   // Handle accordingly
/// }
/// ```

class OptionDialog extends StatefulWidget {
  /// Constructor for dialog
  const OptionDialog({
    super.key,
    this.title,
    this.message,
    this.closeButtonText,
    this.checkButtonText,
  });

  /// Title for the dialog.
  final String? title;

  /// Message for the dialog.
  final String? message;

  /// Text for the close button.
  final String? closeButtonText;

  /// Text for the check button.
  final String? checkButtonText;

  @override
  State<OptionDialog> createState() => _OptionDialogState();

  /// The static method [OptionDialog.show] displays a dialog with the
  /// specified [title] and [message] and returns a [Future<bool?>] that
  /// represents the user's selection.
  static Future<bool?> show({
    required String title,
    required String message,
    required BuildContext context,
  }) async {
    return DialogBase.show<bool>(
      context: context,
      builder: (context) => OptionDialog(
        title: title,
        message: message,
      ),
    );
  }
}

class _OptionDialogState extends State<OptionDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: Text(widget.title ?? ''),
      content: Text(widget.message ?? ''),
      actions: [
        IconButton(
          onPressed: () => Navigator.of(context).pop(false),
          icon: const Icon(Icons.close),
        ),
        IconButton(
          onPressed: () => Navigator.of(context).pop(true),
          icon: const Icon(Icons.check),
        ),
      ],
    );
  }
}
