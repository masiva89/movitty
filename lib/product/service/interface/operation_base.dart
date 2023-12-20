import 'package:movitty/product/service/manager/product_service_warning_manager.dart';

/// This is the base class for all operations.
/// It provides a common interface for operations in the Movitty application.
abstract class OperationBase {
  ProductServiceWarningManager get warningManager =>
      ProductServiceWarningManager.instance;
}
