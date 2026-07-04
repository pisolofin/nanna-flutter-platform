# Extending the Platform with External Libraries

The `nanna_flutter_platform` core library is designed to be lightweight and strictly independent of heavy third-party UI packages (like `macos_ui`, etc.). Instead of coupling the core package to every design system in existence, it uses a **Widget Builder Registry** architecture.

This allows third-party libraries (or your own app code) to dynamically register support for new UI types at runtime without modifying the core package.

## Example: Adding `macos_ui` Support

Suppose you want to create an external library `nanna_macos_ui` to add macOS UI support. You do not need to modify the core `NaPlatformButton`. 
Instead, you register a builder for it.

### 1. Define the Plugin

```dart
import 'package:flutter/widgets.dart';
import 'package:macos_ui/macos_ui.dart' as macos;
import 'package:nanna_flutter_platform/nanna_flutter_platform.dart';

// 1. Define custom options for your specific platform
class MacosButtonOptions extends NaPlatformButtonOptions {
  final bool useAcrylicEffect;
  MacosButtonOptions({this.useAcrylicEffect = false});
}

// 2. Keep track of the registered UI Type
late final NaUiType macosUiType;

// 3. Initialize the plugin
void initNannaMacosUi() {
  // A. Register the new UI type in the global scope
  macosUiType = naPlatformServiceRegisterUiType(
    styleId: 'macos', 
    uiType: 'macos_ui_design',
  );

  // B. Register how to build a NaPlatformButton when macosUiType is active
  naPlatformServiceRegisterWidgetBuilder(
    macosUiType, 
    NaPlatformButton, 
    (BuildContext context, covariant NaPlatformButton widget) {
      // The builder checks if the user provided an optionsBuilder, and executes it 
      // to see if MacosButtonOptions were provided.
      final options = widget.optionsBuilder?.call(context, macosUiType);
      final macosOpts = options is MacosButtonOptions ? options : null;

      // Returns the actual Macos button, passing the base parameters 
      // (child, onPressed) and specific options (useAcrylicEffect).
      return macos.PushButton(
        onPressed: widget.onPressed,
        child: widget.child,
      );
    }
  );
}
```

### 2. How it works behind the scenes

1. **Initialization**: The app calls `initNannaMacosUi()`. The registry now knows how to build a `NaPlatformButton` for the macOS UI type.
2. **Execution**: When a `NaPlatformButton` is placed in the tree:
   - It checks the current `NaUiTypeScope` (if set to `macosUiType`).
   - It asks the service if a builder exists for `NaPlatformButton` + `macosUiType`.
   - The registry returns the builder defined in step 1.
   - The function is executed, returning a real `macos.PushButton`.

This guarantees **100% decoupling**, **Type Safety via Marker Interfaces** (`MacosButtonOptions`), and limitless extensibility.
