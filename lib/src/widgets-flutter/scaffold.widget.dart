import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/ui-type.model.dart';
import '../models/widget-options.model.dart';
import '../widgets/na-widget.widget.dart';

import 'app-bar.widget.dart';

/// Base options for [NaScaffold].
abstract class NaScaffoldOptions extends NaWidgetOptions {}

/// Material-specific options for [NaScaffold], resolving into a [Scaffold].
class NaScaffoldOptionsMaterial extends NaScaffoldOptions {
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final Widget? drawer;
  final bool? resizeToAvoidBottomInset;

  NaScaffoldOptionsMaterial({
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.drawer,
    this.resizeToAvoidBottomInset,
  });
}

/// Cupertino-specific options for [NaScaffold], resolving into a [CupertinoPageScaffold].
class NaScaffoldOptionsCupertino extends NaScaffoldOptions {
  final bool? resizeToAvoidBottomInset;

  NaScaffoldOptionsCupertino({this.resizeToAvoidBottomInset});
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

  @override
  Widget renderForUIType(BuildContext context, NaUiType uiType) {
    final NaScaffoldOptions? options = optionsBuilder?.call(context, uiType);

    if (uiType == NaUiType.cupertino) {
      final NaScaffoldOptionsCupertino? cupertinoOptions =
          options is NaScaffoldOptionsCupertino ? options : null;

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
        navigationBar: this.appBar,
        backgroundColor: this.backgroundColor,
        resizeToAvoidBottomInset:
            cupertinoOptions?.resizeToAvoidBottomInset ?? true,
        child: content,
      );
    }

    final NaScaffoldOptionsMaterial? materialOptions =
        options is NaScaffoldOptionsMaterial ? options : null;
    return Scaffold(
      appBar: this.appBar,
      body: this.body,
      backgroundColor: this.backgroundColor,
      floatingActionButton: materialOptions?.floatingActionButton,
      bottomNavigationBar:
          materialOptions?.bottomNavigationBar ?? this.bottomNavigationBar,
      drawer: materialOptions?.drawer,
      resizeToAvoidBottomInset: materialOptions?.resizeToAvoidBottomInset,
    );
  }
}
