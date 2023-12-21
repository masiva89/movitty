import 'package:flutter/material.dart';
import 'package:movitty/product/state/base/base_cubit.dart';
import 'package:movitty/product/state/view_model/product_state.dart';

/// [ProductViewModel] is a view model for the product module.
final class ProductViewModel extends BaseCubit<ProductState> {
  /// [ProductViewModel] constructor.
  ProductViewModel() : super(const ProductState());

  /// Change theme mode
  /// [themeMode] can be [ThemeMode.light] or [ThemeMode.dark]
  void changeThemeMode(ThemeMode themeMode) {
    emit(state.copyWith(themeMode: themeMode));
  }
}
