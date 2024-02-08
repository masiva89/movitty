import 'package:utils/src/upgrader/enum/upgrade_requirement_type.dart';
import 'package:utils/src/upgrader/extension/version_extension.dart';

/// A utility class for checking upgrade requirements.
class Upgrader {
  static final Upgrader _instance = Upgrader._internal();

  factory Upgrader() {
    return _instance;
  }

  Upgrader._internal();

  /// Checks the upgrade requirement based on the minimum version, maximum version, and current version.
  ///
  /// Returns [UpgradeRequirementType.mustUpgrade] if the current version is lower than the minimum version,
  /// greater than the maximum version, or equal to the minimum version.
  /// Returns [UpgradeRequirementType.none] if the current version is equal to the maximum version.
  /// Returns [UpgradeRequirementType.canUpgrade] for any other case.
  UpgradeRequirementType checkUpgradeRequirement({
    required String minVersion,
    required String maxVersion,
    required String currentVersion,
  }) {
    if (currentVersion.isLowerThan(minVersion)) {
      return UpgradeRequirementType.mustUpgrade;
    } else if (currentVersion.isGreaterThan(maxVersion)) {
      return UpgradeRequirementType.mustUpgrade;
    } else if (currentVersion.isEqualTo(minVersion)) {
      return UpgradeRequirementType.mustUpgrade;
    } else if (currentVersion.isEqualTo(maxVersion)) {
      return UpgradeRequirementType.none;
    } else {
      return UpgradeRequirementType.canUpgrade;
    }
  }
}
