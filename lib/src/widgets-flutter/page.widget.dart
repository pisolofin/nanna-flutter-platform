import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../scopes/ui-type.scope.dart';
import '../models/ui-type.model.dart';
import '../models/widget-options.model.dart';

/// Base options for [NaPage].
abstract class NaPageOptions extends NaWidgetOptions {
  /// Default constructor for subclasses.
  NaPageOptions();

  /// Creates an empty [NaPageOptions] with default values.
  factory NaPageOptions.empty() => NaPageOptionsGeneric.empty();
}

/// Generic options for [NaPage], holding properties common to both platforms.
class NaPageOptionsGeneric extends NaPageOptions {
  final bool maintainState;
  final bool fullscreenDialog;
  final bool allowSnapshotting;

  NaPageOptionsGeneric({
    this.maintainState     = true,
    this.fullscreenDialog  = false,
    this.allowSnapshotting = true,
  });

  /// Creates an empty [NaPageOptionsGeneric] with default values.
  NaPageOptionsGeneric.empty() : this();

  /// Creates a copy of this [NaPageOptionsGeneric] with the given fields replaced by non-null values.
  NaPageOptionsGeneric copyWith({
    bool? maintainState,
    bool? fullscreenDialog,
    bool? allowSnapshotting,
  }) {
    return NaPageOptionsGeneric(
      maintainState    : maintainState ?? this.maintainState,
      fullscreenDialog : fullscreenDialog ?? this.fullscreenDialog,
      allowSnapshotting: allowSnapshotting ?? this.allowSnapshotting,
    );
  }
}

/// Material-specific options for [NaPage], resolving into a [MaterialPage].
class NaPageOptionsMaterial extends NaPageOptionsGeneric {
  NaPageOptionsMaterial({
    super.maintainState,
    super.fullscreenDialog,
    super.allowSnapshotting,
  });

  /// Creates an empty [NaPageOptionsMaterial] with default values.
  NaPageOptionsMaterial.empty() : this();

  /// Creates a [NaPageOptionsMaterial] from generic options.
  NaPageOptionsMaterial.fromGeneric(
    NaPageOptionsGeneric? generic,
  ) : super(
         maintainState    : generic?.maintainState ?? true,
         fullscreenDialog : generic?.fullscreenDialog ?? false,
         allowSnapshotting: generic?.allowSnapshotting ?? true,
       );

  /// Creates a copy of this [NaPageOptionsMaterial] with the given fields replaced by non-null values.
  @override
  NaPageOptionsMaterial copyWith({
    bool? maintainState,
    bool? fullscreenDialog,
    bool? allowSnapshotting,
  }) {
    return NaPageOptionsMaterial(
      maintainState    : maintainState ?? this.maintainState,
      fullscreenDialog : fullscreenDialog ?? this.fullscreenDialog,
      allowSnapshotting: allowSnapshotting ?? this.allowSnapshotting,
    );
  }
}

/// Cupertino-specific options for [NaPage], resolving into a [CupertinoPage].
class NaPageOptionsCupertino extends NaPageOptionsGeneric {
  final String? title;

  NaPageOptionsCupertino({
    this.title,
    super.maintainState,
    super.fullscreenDialog,
    super.allowSnapshotting,
  });

  /// Creates an empty [NaPageOptionsCupertino] with default values.
  NaPageOptionsCupertino.empty() : this();

  /// Creates a [NaPageOptionsCupertino] from generic options.
  NaPageOptionsCupertino.fromGeneric(
    NaPageOptionsGeneric? generic, {
    this.title,
  }) : super(
         maintainState    : generic?.maintainState ?? true,
         fullscreenDialog : generic?.fullscreenDialog ?? false,
         allowSnapshotting: generic?.allowSnapshotting ?? true,
       );

  /// Creates a copy of this [NaPageOptionsCupertino] with the given fields replaced by non-null values.
  @override
  NaPageOptionsCupertino copyWith({
    String? title,
    bool? maintainState,
    bool? fullscreenDialog,
    bool? allowSnapshotting,
  }) {
    return NaPageOptionsCupertino(
      title            : title ?? this.title,
      maintainState    : maintainState ?? this.maintainState,
      fullscreenDialog : fullscreenDialog ?? this.fullscreenDialog,
      allowSnapshotting: allowSnapshotting ?? this.allowSnapshotting,
    );
  }
}

/// A utility class for generating platform-adaptive [Page]s (e.g. for GoRouter).
class NaPage {
  /// Creates the appropriate native [Page] based on the current [NaUiType].
  ///
  /// This requires the [BuildContext] to resolve the current UI type from the [NaUiTypeScope].
  static Page<T> create<T>(
    BuildContext context, {
    required Widget child,
    LocalKey? key,
    String? name,
    Object? arguments,
    String? restorationId,
    NaWidgetOptionsBuilder<NaPageOptions>? optionsBuilder,
  }) {
    final List<NaUiType> uiTypeList = NaUiTypeScope.of(context);

    // Find the first matching natively supported page
    for (final NaUiType type in uiTypeList) {
      final NaPageOptions? options = optionsBuilder?.call(context, type);
      final NaPageOptionsGeneric? genericOptions = options is NaPageOptionsGeneric
        ? options
        : null
      ;

      if (type == NaUiType.cupertino) {
        final NaPageOptionsCupertino? cupertinoOptions = options is NaPageOptionsCupertino
          ? options
          : ((genericOptions != null) ? NaPageOptionsCupertino.fromGeneric(genericOptions) : null)
        ;

        return CupertinoPage<T>(
          key              : key,
          name             : name,
          arguments        : arguments,
          restorationId    : restorationId,
          title            : cupertinoOptions?.title,
          maintainState    : cupertinoOptions?.maintainState ?? true,
          fullscreenDialog : cupertinoOptions?.fullscreenDialog ?? false,
          allowSnapshotting: cupertinoOptions?.allowSnapshotting ?? true,
          child            : child,
        );
      }

      if (type == NaUiType.material) {
        final NaPageOptionsMaterial? materialOptions = options is NaPageOptionsMaterial
          ? options
          : ((genericOptions != null) ? NaPageOptionsMaterial.fromGeneric(genericOptions) : null)
        ;

        return MaterialPage<T>(
          key              : key,
          name             : name,
          arguments        : arguments,
          restorationId    : restorationId,
          maintainState    : materialOptions?.maintainState ?? true,
          fullscreenDialog : materialOptions?.fullscreenDialog ?? false,
          allowSnapshotting: materialOptions?.allowSnapshotting ?? true,
          child            : child,
        );
      }
    }

    // Ultimate fallback
    final NaPageOptions? fallbackOptions = optionsBuilder?.call(context, NaUiType.material);
    final NaPageOptionsGeneric? genericFallbackOptions = fallbackOptions is NaPageOptionsGeneric
      ? fallbackOptions
      : null
    ;
    final NaPageOptionsMaterial? materialOptions = fallbackOptions is NaPageOptionsMaterial
      ? fallbackOptions
      : ((genericFallbackOptions != null) ? NaPageOptionsMaterial.fromGeneric(genericFallbackOptions) : null)
    ;

    return MaterialPage<T>(
      key              : key,
      name             : name,
      arguments        : arguments,
      restorationId    : restorationId,
      maintainState    : materialOptions?.maintainState ?? true,
      fullscreenDialog : materialOptions?.fullscreenDialog ?? false,
      allowSnapshotting: materialOptions?.allowSnapshotting ?? true,
      child            : child,
    );
  }
}
