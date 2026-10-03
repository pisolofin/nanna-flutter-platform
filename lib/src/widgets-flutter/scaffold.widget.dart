import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'app-bar.widget.dart';
import '../models/ui-type.model.dart';
import '../widgets/na-widget.widget.dart';
import '../models/widget-options.model.dart';

/// Base options for [NaScaffold].
abstract class NaScaffoldOptions extends NaWidgetOptions {
  /// Default constructor for subclasses.
  NaScaffoldOptions();

  /// Creates an empty [NaScaffoldOptions] with default values.
  factory NaScaffoldOptions.empty() => NaScaffoldOptionsGeneric.empty();
}

/// Generic options for [NaScaffold], holding properties common to both platforms.
class NaScaffoldOptionsGeneric extends NaScaffoldOptions {
  final bool? resizeToAvoidBottomInset;

  NaScaffoldOptionsGeneric({
    this.resizeToAvoidBottomInset,
  });

  /// Creates an empty [NaScaffoldOptionsGeneric] with default values.
  NaScaffoldOptionsGeneric.empty() : this();

  /// Creates a copy of this [NaScaffoldOptionsGeneric] with the given fields replaced by non-null values.
  NaScaffoldOptionsGeneric copyWith({
    bool? resizeToAvoidBottomInset,
  }) {
    return NaScaffoldOptionsGeneric(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? this.resizeToAvoidBottomInset,
    );
  }
}

/// Material-specific options for [NaScaffold], resolving into a [Scaffold].
class NaScaffoldOptionsMaterial extends NaScaffoldOptionsGeneric {
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final Widget? drawer;

  NaScaffoldOptionsMaterial({
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.drawer,
    super.resizeToAvoidBottomInset,
  });

  /// Creates an empty [NaScaffoldOptionsMaterial] with default values.
  NaScaffoldOptionsMaterial.empty() : this();

  /// Creates a copy of this [NaScaffoldOptionsMaterial] with the given fields replaced by non-null values.
  @override
  NaScaffoldOptionsMaterial copyWith({
    Widget? floatingActionButton,
    Widget? bottomNavigationBar,
    Widget? drawer,
    bool? resizeToAvoidBottomInset,
  }) {
    return NaScaffoldOptionsMaterial(
      floatingActionButton    : floatingActionButton ?? this.floatingActionButton,
      bottomNavigationBar     : bottomNavigationBar ?? this.bottomNavigationBar,
      drawer                  : drawer ?? this.drawer,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? this.resizeToAvoidBottomInset,
    );
  }
}

/// Cupertino-specific options for [NaScaffold], resolving into a [CupertinoPageScaffold].
class NaScaffoldOptionsCupertino extends NaScaffoldOptionsGeneric {
  NaScaffoldOptionsCupertino({
    super.resizeToAvoidBottomInset,
  });

  /// Creates an empty [NaScaffoldOptionsCupertino] with default values.
  NaScaffoldOptionsCupertino.empty() : this();

  /// Creates a copy of this [NaScaffoldOptionsCupertino] with the given fields replaced by non-null values.
  @override
  NaScaffoldOptionsCupertino copyWith({
    bool? resizeToAvoidBottomInset,
  }) {
    return NaScaffoldOptionsCupertino(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? this.resizeToAvoidBottomInset,
    );
  }
}

/// A generic Scaffold widget that automatically renders a [Scaffold] on Material
/// and a [CupertinoPageScaffold] on Cupertino.
class NaScaffold extends NaWidget {
  final NaAppBar? appBar;
  final Widget body;
  final Color? backgroundColor;
  final Widget? bottomNavigationBar;

  final NaWidgetOptionsBuilder<NaScaffoldOptions>? optionsBuilder;

  const NaScaffold({
    super.key,
    this.appBar,
    required this.body,
    this.backgroundColor,
    this.bottomNavigationBar,
    this.optionsBuilder,
    super.uiType,
  });

  /// Creates a copy of this [NaScaffold] with the given fields replaced with the new values.
  NaScaffold copyWith({
    Key? key,
    NaAppBar? appBar,
    Widget? body,
    Color? backgroundColor,
    Widget? bottomNavigationBar,
    NaWidgetOptionsBuilder<NaScaffoldOptions>? optionsBuilder,
    NaUiType? uiType,
  }) {
    return NaScaffold(
      key                : key ?? this.key,
      appBar             : appBar ?? this.appBar,
      body               : body ?? this.body,
      backgroundColor    : backgroundColor ?? this.backgroundColor,
      bottomNavigationBar: bottomNavigationBar ?? this.bottomNavigationBar,
      optionsBuilder     : optionsBuilder ?? this.optionsBuilder,
      uiType             : uiType ?? this.uiType,
    );
  }

  @override
  Widget? renderForUIType(BuildContext context, NaUiType uiType) {
    final NaScaffoldOptions? options = optionsBuilder?.call(context, uiType);
    final NaScaffoldOptionsGeneric? genericOptions = options is NaScaffoldOptionsGeneric
      ? options
      : null
    ;

    if (uiType == NaUiType.cupertino) {
      Widget content = this.body;
      if (this.bottomNavigationBar != null) {
        content = Column(
          children: [
            Expanded(child: content),
            this.bottomNavigationBar!,
          ],
        );
      }

      return CupertinoPageScaffold(
        navigationBar           : this.appBar,
        backgroundColor         : this.backgroundColor,
        resizeToAvoidBottomInset:
            genericOptions?.resizeToAvoidBottomInset ?? true,
        child: content,
      );
    }

    if (uiType == NaUiType.material) {
      final NaScaffoldOptionsMaterial? materialOptions = options is NaScaffoldOptionsMaterial
        ? options
        : null
      ;
      return Scaffold(
        appBar              : this.appBar,
        body                : this.body,
        backgroundColor     : this.backgroundColor,
        floatingActionButton: materialOptions?.floatingActionButton,
        bottomNavigationBar :
            materialOptions?.bottomNavigationBar ?? this.bottomNavigationBar,
        drawer                  : materialOptions?.drawer,
        resizeToAvoidBottomInset: genericOptions?.resizeToAvoidBottomInset,
      );
    }

    return null;
  }
}
