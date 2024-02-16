import 'package:gen/gen.dart';
import 'package:movitty/product/service/interface/operation_base.dart';

/// An abstract class representing the operations related to the discover
/// screen.
///
/// It extends the [OperationBase] class. It contains the abstract method
/// [discoverSections] which retrieves a list of sections for the discover
/// screen.
///
abstract class DiscoverOperation extends OperationBase {
  /// Retrieves a list of sections for the discover screen.
  Future<DiscoverSections> discoverSections();
}
