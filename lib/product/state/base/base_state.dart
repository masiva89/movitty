import 'package:flutter/material.dart';
import 'package:movitty/product/service/manager/index.dart';
import 'package:movitty/product/state/container/product_state_items.dart';
import 'package:movitty/product/state/view_model/product_view_model.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  ProductNetworkManager get productNetworkManager =>
      ProductStateItems.productNetworkManager;

  ProductViewModel get productViewModel => ProductStateItems.productViewModel;
}
