import 'package:core/core.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:movitty/feature/home/view_model/index.dart';
import 'package:movitty/product/cache/index.dart';
import 'package:movitty/product/service/index.dart';
import 'package:movitty/product/state/base/base_cubit.dart';

/// Manage your home view business logic
final class HomeViewModel extends BaseCubit<HomeState> {
  /// [AuthenticationOperation] service
  HomeViewModel({
    required AuthenticationOperation operationService,
    required HiveCacheOperation<UserCacheModel> userCacheOperation,
  })  : _authenticationOperationService = operationService,
        _userCacheOperation = userCacheOperation,
        super(const HomeState(isLoading: false));

  final AuthenticationOperation _authenticationOperationService;
  final HiveCacheOperation<UserCacheModel> _userCacheOperation;

  /// Change loading state
  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  /// Get users
  Future<void> fetchUsers() async {
    CustomLogger.showError<User>(usersFromCache);
    /* final response = await _authenticationOperationService.users();
    _saveItems(response);
    emit(state.copyWith(users: response)); */
  }

  /// Save users to cache
  void _saveItems(List<User> user) {
    for (final element in user) {
      _userCacheOperation.add(UserCacheModel(user: element));
    }
  }

  /// Get users from cache
  List<User> get usersFromCache =>
      _userCacheOperation.getAll().map((e) => e.user).toList();
}
