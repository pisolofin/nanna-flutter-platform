import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/ui-type.model.dart';
import '../models/widget-options.model.dart';
import '../widgets/platform-widget.widget.dart';

abstract class NaPlatformButtonOptions extends NaWidgetOptions {}

class NaPlatformButton extends NaPlatformWidget {
  final Widget child;
  final VoidCallback onPressed;

  /// Function to resolve platform-specific options at runtime.
  final NaWidgetOptionsBuilder<NaPlatformButtonOptions>? optionsBuilder;

  const NaPlatformButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.optionsBuilder,
    super.uiType,
  });

  @override
  Widget renderForUIType(BuildContext context, NaUiType uiType) {
    // 1. Resolve options via the builder provided by the user (if present)
    final NaPlatformButtonOptions? options = optionsBuilder?.call(
      context,
      uiType,
    );

    // 2. Check type and render accordingly
    if (uiType == NaUiType.cupertino) {
      // (Example: you could cast options to NaCupertinoButtonOptions to read specific properties)
      return CupertinoButton(onPressed: this.onPressed, child: this.child);
    }

    // Default fallback to Material
    return ElevatedButton(onPressed: this.onPressed, child: this.child);
  }
}
