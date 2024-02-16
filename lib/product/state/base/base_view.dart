import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:movitty/product/navigation/app_router.dart';
import 'package:movitty/product/navigation/guard/enum/user_status.dart';
import 'package:movitty/product/state/base/base_equatable.dart';
import 'package:movitty/product/state/index.dart';
import 'package:movitty/product/utility/constants/index.dart';
import 'package:movitty/product/widget/button/index.dart';
import 'package:movitty/product/widget/loading/custom_loading.dart';
import 'package:movitty/product/widget/loading/product_loading_animation.dart';
import 'package:movitty/product/widget/padding/project_padding.dart';

/// Base class for views that are connected to a [BaseCubit] and use
/// [StateEquatable] as the state.
///
///
class BaseView<T extends BaseCubit<R>, R extends StateEquatable>
    extends StatefulWidget {
  /// Creates a new [BaseView] instance.
  ///
  /// The [vmBuilder] and [builder] parameters are required. The [vmBuilder]
  /// parameter is a function that creates an instance of [BaseCubit]. The
  /// [builder] parameter is a function that builds the UI based on the
  /// [BuildContext] and the [BaseCubit] and [StateEquatable] instances.
  ///
  /// The [onInitialize] parameter is optional. If provided, it will be called
  /// when the view before initialized.
  ///
  /// The [useDefaultLoading] parameter is optional. If set to `true`, the
  /// default loading widget will be used.
  const BaseView({
    this.onInitialize,
    this.vmBuilder,
    this.builder,
    this.useDefaultLoading = true,
    this.authGuardEnabled = false,
    super.key,
  }) : assert(
          vmBuilder != null || builder != null,
          'vmBuilder or builder must not be null',
        );

  /// The function that creates an instance of [BaseCubit].
  final T Function(BuildContext context)? vmBuilder;

  /// The function that builds the UI based on the [BuildContext] and the
  final Widget Function(BuildContext, T, R)? builder;

  final Function(BuildContext)? onInitialize;

  /// A boolean value that indicates whether the default loading widget should
  /// be used.
  final bool useDefaultLoading;

  /// A boolean value that indicates whether the auth guard is enabled.
  final bool authGuardEnabled;

  @override
  _BaseViewState createState() => _BaseViewState<T, R>();
}

class _BaseViewState<T extends BaseCubit<R>, R extends StateEquatable>
    extends BaseState<BaseView<T, R>> {
  @override
  void initState() {
    super.initState();
    widget.onInitialize?.call(context);
  }

  @override
  Widget build(BuildContext context) {
    return switch (widget.authGuardEnabled) {
      true => switch (productViewModel.userAuthStatus == UserStatus.loggedIn) {
          false => _buildUnauthenticated(),
          true => _buildAuthenticated(),
        },
      false => _buildAuthenticated(),
    };
  }

  Widget _buildAuthenticated() {
    return BlocProvider<T>(
      create: (context) => widget.vmBuilder!(context),
      child: BlocBuilder<T, R>(
        builder: _buildAuthenticatedContent,
      ),
    );
  }

  Widget _buildAuthenticatedContent(BuildContext context, R state) {
    if (state.status == StateType.LOADING && widget.useDefaultLoading) {
      return const CustomLoading();
    }
    if (state.status == StateType.ERROR) {
      return Padding(
        padding: ProjectPadding.allMedium(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.errorViewImage.svg(
              package: 'gen',
              height: context.general.mediaSize.height * 0.2,
            ),
            ProjectSpacer.xLargeHeight(context),
            Text(
              'Haydaa!',
              textAlign: TextAlign.center,
              style: TextStyles.header2(context),
            ),
            ProjectSpacer.mediumHeight(context),
            Text(
              'Bir şeyler ters gitmiş gibi görünüyor. Lütfen daha sonra tekrar deneyin.',
              textAlign: TextAlign.center,
              style: TextStyles.body(context),
            ),
            ProjectSpacer.xLargeHeight(context),
            ProjectSpacer.xLargeHeight(context),
            MiniButton(
              title: 'Tekrar Dene',
              onPressed: () {
                context.read<T>().initialEvent(context);
              },
            ),
          ],
        ),
      );
    }
    return IgnorePointer(
      ignoring: state.isLoading,
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            reverseDuration: const Duration(milliseconds: 300),
            child:
                state.isLoading ? _buildFadeLoading : const SizedBox.shrink(),
          ),
          widget.builder!(context, context.watch<T>(), state),
        ],
      ),
    );
  }

  Widget _buildUnauthenticated() {
    return SizedBox.expand(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              ShaderMask(
                shaderCallback: (bounds) {
                  return LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    transform: const GradientRotation(-0.5),
                    colors: [
                      ColorName.backgroundPrimary.withOpacity(1),
                      ColorName.backgroundPrimary.withOpacity(1),
                      ColorName.backgroundPrimary.withOpacity(0.9),
                      ColorName.backgroundPrimary.withOpacity(0.5),
                      ColorName.backgroundPrimary.withOpacity(0.1),
                    ],
                  ).createShader(bounds);
                },
                blendMode: BlendMode.srcOver,
                child: Assets.images.onboardBackgroundImage.image(
                  package: 'gen',
                  fit: BoxFit.contain,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: ProjectPadding.horizontalMedium(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tüm özelliklerden faydalanmak için',
                      style: TextStyles.subtitle1(
                        context,
                      ),
                    ),
                    Text(
                      'Giriş Yapın',
                      style: TextStyles.header1(context),
                    ),
                    ProjectSpacer.largeHeight(context),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: ProjectPadding.allMedium(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Üye olarak aşağıdaki özelliklerin tadını çıkarma fırsatını yakalayın:',
                  style: TextStyles.body(context),
                ),
                ProjectSpacer.largeHeight(context),
                Padding(
                  padding: ProjectPadding.horizontalXLarge(context),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '• Kişiselleştirilmiş önerilerden faydalanın',
                        style: TextStyles.body(
                          context,
                          color: ColorName.primary2,
                        ),
                      ),
                      ProjectSpacer.smallHeight(context),
                      Text(
                        '• İzlediğiniz filmleri ve dizileri değerlendirin',
                        style: TextStyles.body(
                          context,
                          color: ColorName.primary2,
                        ),
                      ),
                      ProjectSpacer.smallHeight(context),
                      Text(
                        '• Geliştirilmiş arama ile istediğiniz içeriği anında bulun',
                        style: TextStyles.body(
                          context,
                          color: ColorName.primary2,
                        ),
                      ),
                      ProjectSpacer.smallHeight(context),
                      Text(
                        '• İstediğiniz tarzlarda listeler olşuturun ve arkadaşlarınızla paylaşın',
                        style: TextStyles.body(
                          context,
                          color: ColorName.primary2,
                        ),
                      ),
                    ],
                  ),
                ),
                ProjectSpacer.xLargeHeight(context),
                MiniButton(
                  //isPrimary: false,
                  buttonType: ButtonType.tertiary,
                  title: 'Giriş Yap',
                  onPressed: () {
                    context.router.replaceAll([const AuthNavRoute()]);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget get _buildFadeLoading {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [
            Colors.black.withOpacity(0.6),
            Colors.black.withOpacity(0.1),
          ],
        ),
      ),
      child: const Center(
        child: ProductLoadingAnimation(),
      ),
    );
  }
}
