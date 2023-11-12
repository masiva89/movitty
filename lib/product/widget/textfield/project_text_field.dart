// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:movitty/product/utility/constants/decoration/enums/font_sizes.dart';
import 'package:movitty/product/utility/constants/decoration/extension/responsive_ext.dart';
import 'package:movitty/product/utility/constants/decoration/project_radius.dart';
import 'package:movitty/product/utility/constants/decoration/project_size.dart';
import 'package:movitty/product/utility/constants/decoration/text_styles.dart';
import 'package:movitty/product/utility/validator/i_textfield_validator.dart';
import 'package:movitty/product/widget/textfield/test_custom_textfield.dart';
import 'package:widgets/widgets.dart';

/// Project textfield.
class ProjectTextField extends StatefulWidget {
  /// Project textfield constructor.
  const ProjectTextField({
    required this.controller,
    required this.isPassword,
    required this.label,
    required this.hintText,
    super.key,
    this.focusNode,
    this.textInputAction,
    this.keyboardType,
    this.onChanged,
    this.prefixIcon,
    this.validator,
  });

  final TextEditingController controller;
  final bool isPassword;
  final String label;
  final String hintText;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final SvgGenImage? prefixIcon;
  final ITextFieldValidator? validator;

  @override
  State<ProjectTextField> createState() => _ProjectTextFieldState();
}

class _ProjectTextFieldState extends State<ProjectTextField> {
  final Color primaryColor = ColorName.primary2;
  final Color secondaryColor = ColorName.backgroundSecondary;
  final Color tertiaryColor = ColorName.primary3;

  bool _isObscure = true;
  late ITextFieldValidator? _validator;

  @override
  void initState() {
    super.initState();
    _validator = widget.validator;
  }

  @override
  Widget build(BuildContext context) {
    final pads = TextFieldSizes(
      fontSize: FontSizes.subtitle1.responsive(context),
      iconSize: ProjectSize.large.responsive(context),
      radius: ProjectRadius.small.responsive(context),
      padding: EdgeInsets.all(ProjectSize.medium.responsive(context)),
    );
    return TestCustomTextfield(
      errorWidget: _validator?.alertWidget,
      prefixIcon: widget.prefixIcon?.svg(package: 'gen'),
      focusNode: widget.focusNode,
      keyboardType: widget.keyboardType,
      onChanged: (value) {
        widget.onChanged?.call(value);
        _validator?.onUpdate(value);
        setState(() {});
      },
      onSubmitted: (p0) {
        _validator?.validate();
        setState(() {});
      },
      textInputAction: widget.textInputAction,
      isPassword: widget.isPassword,
      controller: widget.controller,
      label: widget.label,
      hintText: widget.hintText,
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      tertiaryColor: tertiaryColor,
      isObscure: widget.isPassword && _isObscure,
      suffixIcon: ObscureWidget(
        onTap: () => setState(() {
          _isObscure = !_isObscure;
        }),
        isObscure: _isObscure,
      ),
      pads: pads,
      textStyle: TextStyles.subtitle1(context),
      hintStyle: TextStyles.subtitle1(context).copyWith(
        color: ColorName.primary3,
      ),
      labelStyle: TextStyles.subtitle1(context).copyWith(
        color: ColorName.primary,
      ),
    );
  }
}

/// Obscure widget.
class ObscureWidget extends StatefulWidget {
  /// Obscure widget constructor.
  const ObscureWidget({
    required this.isObscure,
    super.key,
    this.onTap,
  });

  final void Function()? onTap;
  final bool isObscure;

  @override
  State<ObscureWidget> createState() => _ObscureWidgetState();
}

class _ObscureWidgetState extends State<ObscureWidget> {
  late bool _isObscure;

  @override
  void initState() {
    super.initState();
    print('initState');
    print(widget.isObscure);
    _isObscure = widget.isObscure;
  }

  @override
  void didUpdateWidget(covariant ObscureWidget oldWidget) {
    print('oldWidget.isObscure != widget.isObscure');
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isObscure != widget.isObscure) {
      _isObscure = widget.isObscure;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) {
          return ScaleTransition(
            scale: animation,
            child: child,
          );
        },
        child: _isObscure
            ? Assets.icons.visibility.svg(
                package: 'gen',
                colorFilter: const ColorFilter.mode(
                  ColorName.primary2,
                  BlendMode.srcIn,
                ),
              )
            : Assets.icons.visibilityOff.svg(
                package: 'gen',
                colorFilter: const ColorFilter.mode(
                  ColorName.primary2,
                  BlendMode.srcIn,
                ),
              ),
      ),
    );
  }
}
