import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:gen/gen.dart';
import 'package:movitty/product/navigation/app_router.dart';
import 'package:movitty/product/navigation/guard/enum/user_status.dart';
import 'package:movitty/product/navigation/guard/mixin/guard_mixin.dart';
import 'package:widgets/widgets.dart';

class AuthRestrictedPageGuard extends AutoRouteGuard with GuardMixin {
  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    log('--- AuthRestrictedPageGuard ---');
    switch (userAuthStatus) {
      case UserStatus.notLoggedIn || UserStatus.notVerified:
        log('User is logged in');
        resolver.next();
      case UserStatus.loggedIn:
        log('User is not logged in');
        final result = await OptionDialog.show(
          context: router.navigatorKey.currentState!.context,
          title: 'Giriş Yap',
          message: 'Bu özellikten faydalanmak için giriş yapmalısınız.',
          closeButtonText: 'Kapat',
          checkButtonText: 'Giriş Yap',
          checkColor: ColorName.primary,
        );
        if (result ?? false) {
          await router.replace(const LoginRoute());
        }
    }
  }
}
