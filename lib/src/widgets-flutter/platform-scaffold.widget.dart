import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/ui-type.model.dart';
import '../models/widget-options.model.dart';
import '../widgets/platform-widget.widget.dart';

import 'platform-app-bar.widget.dart';

/// Base options for [NaPlatformScaffold].
abstract class NaPlatformScaffoldOptions extends NaWidgetOptions {}

/// Material-specific options for [NaPlatformScaffold], resolving into a [Scaffold].
class NaPlatformScaffoldOptionsMaterial extends NaPlatformScaffoldOptions {
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final Widget? drawer;
  final bool? resizeToAvoidBottomInset;

  NaPlatformScaffoldOptionsMaterial({
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.drawer,
    this.resizeToAvoidBottomInset,
  });
}

/// Cupertino-specific options for [NaPlatformScaffold], resolving into a [CupertinoPageScaffold].
class NaPlatformScaffoldOptionsCupertino extends NaPlatformScaffoldOptions {
  final bool? resizeToAvoidBottomInset;

  NaPlatformScaffoldOptionsCupertino({this.resizeToAvoidBottomInset});
}

/// A generic Scaffold widget that automatically renders a [Scaffold] on Material
/// and a [CupertinoPageScaffold] on Cupertino.
class NaPlatformScaffold extends NaPlatformWidget {
  final NaPlatformAppBar? appBar;
  final Widget body;
  final Color? backgroundColor;

  final NaWidgetOptionsBuilder<NaPlatformScaffoldOptions>? optionsBuilder;

  const NaPlatformScaffold({
    super.key,
    this.appBar,
    required this.body,
    this.backgroundColor,
    this.optionsBuilder,
    super.uiType,
  });

  @override
  Widget renderForUIType(BuildContext context, NaUiType uiType) {
    final NaPlatformScaffoldOptions? options = optionsBuilder?.call(
      context,
      uiType,
    );

    if (uiType == NaUiType.cupertino) {
      final NaPlatformScaffoldOptionsCupertino? cupertinoOptions =
          options is NaPlatformScaffoldOptionsCupertino ? options : null;
      return CupertinoPageScaffold(
        navigationBar: this.appBar,
        backgroundColor: this.backgroundColor,
        resizeToAvoidBottomInset:
            cupertinoOptions?.resizeToAvoidBottomInset ?? true,
        child: this.body,
      );
    }

    final NaPlatformScaffoldOptionsMaterial? materialOptions =
        options is NaPlatformScaffoldOptionsMaterial ? options : null;
    return Scaffold(
      appBar: this.appBar,
      body: this.body,
      backgroundColor: this.backgroundColor,
      floatingActionButton: materialOptions?.floatingActionButton,
      bottomNavigationBar: materialOptions?.bottomNavigationBar,
      drawer: materialOptions?.drawer,
      resizeToAvoidBottomInset: materialOptions?.resizeToAvoidBottomInset,
    );
  }
}
