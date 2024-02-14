import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:gen/src/model/core/section/section.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'discover_sections.g.dart';

@JsonSerializable()
@immutable

/// Represents the sections of the explore page in the Movitty app.
///
/// This class is responsible for modeling the sections of the explore page.
/// It implements the [INetworkModel] interface and the [EquatableMixin] mixin.
///
/// The [sections] property holds a list of [Section] objects, which represent
/// individual sections in the explore page.
///
/// This class provides methods for JSON serialization and deserialization,
/// as well as for creating copies of the object with updated fields.
class DiscoverSections extends INetworkModel<DiscoverSections>
    with EquatableMixin {
  /// Constructs a new instance of [DiscoverSections].
  ///
  /// The [sections] parameter represents the list of sections in the explore
  /// page.
  DiscoverSections({this.sections});

  factory DiscoverSections.fromJson(Map<String, dynamic> json) =>
      _$DiscoverSectionsFromJson(json);

  /// The list of sections in the explore page.
  final List<Section>? sections;

  @override
  DiscoverSections fromJson(Map<String, dynamic> json) {
    return _$DiscoverSectionsFromJson(json);
  }

  @override
  List<Object?> get props => [sections];

  @override
  Map<String, dynamic>? toJson() {
    return _$DiscoverSectionsToJson(this);
  }

  /// Creates a copy of this [DiscoverSections] object with the given fields
  /// replaced with the new values.
  DiscoverSections copyWith({
    List<Section>? sections,
  }) {
    return DiscoverSections(
      sections: sections ?? this.sections,
    );
  }
}
