# Extending the Platform with External Libraries

The `nanna_flutter_platform` core library is designed to be lightweight and strictly independent of heavy third-party UI packages (like `fluent_ui`, `macos_ui`, etc.). Instead of coupling the core package to every design system in existence, it uses a **Widget Builder Registry** architecture.

This allows external libraries to seamlessly inject their own design system logic into the generic widgets provided by the core package.

## How it works

When an app uses a generic widget like `NaPlatformButton`, the widget first checks the global registry to see if an external builder has been registered for the currently active `NaUiType`. If a match is found, the widget delegates its rendering to that external builder. Otherwise, it falls back to its default implementation (usually Material or Cupertino).

## Example: Creating a Plugin Library

Suppose you want to create an external library `nanna_fluent_ui` to add Windows Fluent UI support. You do not need to modify the core `NaPlatformButton`.

Here is how the external library would register itself:

```dart
import 'package:flutter/widgets.dart';
// 1. Import the core platform package
import 'package:nanna_flutter_platform/nanna_flutter_platform.dart';
// Import the actual UI widgets from the third-party package
import 'package:fluent_ui/fluent_ui.dart' as fluent;

// 2. Create specific options extending the core ones
class FluentButtonOptions extends NaPlatformButtonOptions {
  final bool useAcrylicEffect;
  FluentButtonOptions({this.useAcrylicEffect = false});
}

// Global variable for the new UI type
late final NaUiType fluentUiType;

/// 3. Initialization function to be called at app startup
void initNannaFluentUi() {
  // A. Register the new UI type
  fluentUiType = naPlatformServiceRegisterUiType(
    styleId: 'fluent', 
    uiType: 'fluent_ui_design',
  );

  // B. Register how to build a NaPlatformButton when fluentUiType is active
  naPlatformServiceRegisterWidgetBuilder<NaPlatformButton>(
    fluentUiType, 
    (BuildContext context, NaPlatformButton widget) {

      // The external library reads the user's optionsBuilder 
      // to see if FluentButtonOptions were provided.
      final options = widget.optionsBuilder?.call(context, fluentUiType);
      final fluentOpts = options is FluentButtonOptions ? options : null;

      // Returns the actual Fluent button, passing the base parameters 
      // from the NaPlatformButton, plus the specific options!
      return fluent.Button(
        onPressed: widget.onPressed,
        // E.g., apply acrylic style if requested by the user
        style: fluentOpts?.useAcrylicEffect == true ? fluent.AcrylicStyle() : null,
        child: widget.child,
      );
    }
  );

  // C. Register builders for other widgets here (TextField, Switch, etc.)
}
```

### Lifecycle summary:
1. **Initialization**: The app calls `initNannaFluentUi()`. The registry now knows how to build a `NaPlatformButton` for the Fluent UI type.
2. **Usage**: The developer places `NaPlatformButton(...)` in their code.
3. **Rendering**:
   - The base `NaPlatformWidget.build()` method is triggered.
   - It checks the current `NaUiTypeScope` (if set to `fluentUiType`).
   - It asks the service if a builder exists for `NaPlatformButton` + `fluentUiType`.
   - The service returns the function defined in step B.
   - The function is executed, returning a real `fluent.Button`.
