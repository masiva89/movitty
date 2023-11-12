import 'package:flutter/material.dart';
import 'package:widgets/src/core/bottomsheet_base.dart';

/// Show a bottomsheet for operation
class OperationBottomsheet extends StatelessWidget {
  /// Constructor for bottomsheet
  const OperationBottomsheet({
    required this.title,
    required this.body,
    super.key,
    this.onConfirm,
    this.onCancel,
  });

  /// Title for the bottomsheet
  final String title;

  /// Show the bottomsheet for operation
  final Widget body;

  /// Show the bottomsheet for operation
  final Function? onConfirm;

  /// Show the bottomsheet for operation
  final Function? onCancel;

  /// Show the bottomsheet for operation
  Future<bool> show({
    required BuildContext context,
    bool isFixed = true,
  }) async {
    if (isFixed) {
      await BottomsheetBase.showFixed<bool>(
        context: context,
        builder: (context) => OperationBottomsheet(
          title: title,
          body: body,
          onConfirm: onConfirm,
          onCancel: onCancel,
        ),
      );
    } else {
      await BottomsheetBase.show<bool>(
        context: context,
        builder: (context) => OperationBottomsheet(
          title: title,
          body: body,
          onConfirm: onConfirm,
          onCancel: onCancel,
        ),
      );
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  onCancel?.call();
                },
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          body,
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              onConfirm?.call();
            },
            child: const Text('data'),
          ),
        ],
      ),
    );
  }
}
