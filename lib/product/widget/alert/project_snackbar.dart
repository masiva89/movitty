import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:movitty/main.dart';
import 'package:movitty/product/utility/constants/decoration/project_radius.dart';
import 'package:movitty/product/utility/constants/decoration/text_styles.dart';
import 'package:movitty/product/widget/alert/enum/alert_icon_setter.dart';
import 'package:widgets/widgets.dart';

/// ProjectSnackbarType
enum ProjectSnackbarType { success, error, warning, info }

/// ProjectSnackbar
@immutable
class ProjectSnackbar {
  /// ProjectSnackbar Constructor
  ProjectSnackbar({
    required this.message,
    required this.type,
    this.title,
    this.duration = const Duration(seconds: 3),
  }) {
    customSnackbar = CustomSnackbar(
      scaffoldMessengerState: scaffoldMessengerKey.currentState!,
      radius: ProjectRadius.medium.responsive(context),
      primaryColor: ColorName.primary,
      secondaryColor: ColorName.backgroundSecondary,
      tertiaryColor: ColorName.primary3,
      elevation: 0,
      message: message,
      title: title,
      duration: duration,
      titleTextStyle: TextStyles.subtitle1(context, color: ColorName.primary3),
      messageTextStyle: TextStyles.body(context),
      icon: type.icon(context),
      animation: CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
        reverseCurve: Curves.easeIn,
      ),
    );
  }

  final AnimationController animationController = AnimationController(
    vsync: scaffoldMessengerKey.currentState!,
    duration: const Duration(milliseconds: 1000),
  );

  late CustomSnackbar customSnackbar;

  BuildContext get context => scaffoldMessengerKey.currentState!.context;

  /// Snackbar message text.
  final String message;

  /// Snackbar title text.
  final String? title;

  /// Snackbar type.
  final ProjectSnackbarType type;

  /// Snackbar duration.
  final Duration duration;

  void show() {
    if (scaffoldMessengerKey.currentState == null) {
      print('scaffoldMessengerKey.currentState is null');
      return;
    }
    scaffoldMessengerKey.currentState!.clearSnackBars();
    customSnackbar.show(
      message: message,
      duration: duration,
    );
    print('snackbar showed');
  }
}
