# nanna_flutter_platform

This library provides unified cross-platform components for Flutter apps.
Instead of writing platform-conditional code (`if (Platform.isIOS) ...`) on every screen, `nanna_flutter_platform` exposes generic widgets (like `NaButton`) that automatically translate into the appropriate native design system:
- **Material Design** for Android, Web, and Linux
- **Cupertino** for iOS and macOS

## Supported Widgets Status

| Flutter Widget (Material) | Cupertino Equivalent | Implemented | Component Name |
| --- | --- | :---: | --- |
| `MaterialApp` | `CupertinoApp` | ✅ | `NaApp` |
| `Scaffold` | `CupertinoPageScaffold` | ✅ | `NaScaffold` |
| `AppBar` | `CupertinoNavigationBar`| ✅ | `NaAppBar` |
| `ElevatedButton` | `CupertinoButton` | ✅ | `NaButton` |
| `IconButton` | `CupertinoButton` (icon) | ✅ | `NaIconButton` |
| `Switch` | `CupertinoSwitch` | ✅ | `NaSwitch` |
| `Checkbox` | `CupertinoCheckbox` | ✅ | `NaCheckbox` |
| `Slider` | `CupertinoSlider` | ✅ | `NaSlider` |
| `CircularProgressIndicator`| `CupertinoActivityIndicator`| ✅ | `NaProgressIndicator` |
| `Card` | `Container` (decorated) | ✅ | `NaCard` |
| `AlertDialog` | `CupertinoAlertDialog` | ✅ | `NaAlertDialog` |
| `BottomNavigationBar` | `CupertinoTabBar` | ✅ | `NaBottomNavigationBar` |
| `DatePicker` | `CupertinoDatePicker` | ✅ | `NaDatePicker` |
| `TimePicker` | `CupertinoTimerPicker` | ✅ | `NaTimePicker` |
| `ListTile` | `CupertinoListTile` | ✅ | `NaListTile` |
| `Radio` | `CupertinoRadio` | ✅ | `NaRadio` |
| `Icon` | `Icon` (cupertino variants) | ✅ | `NaIcon` |
| `Dialog Action` | `CupertinoDialogAction` | ✅ | `NaDialogAction` |
| `TextField` | `CupertinoTextField` | ✅ | `NaTextField` |


## How to use the library

### 1. Initialize the Scope (NaUiTypeScope)
To make your entire app (or a portion of it) use a specific design system, wrap your widgets inside a `NaUiTypeScope`:

```dart
import 'package:flutter/widgets.dart';
import 'package:nanna_flutter_platform/nanna_flutter_platform.dart';

void main() {
  runApp(
    NaUiTypeScope(
      // Change this value to switch the entire UI (e.g. NaUiType.cupertino)
      uiType: NaUiType.material, 
      child: const MyApp(),
    )
  );
}
```

### 2. Create and use Widgets (Options Builder Pattern)
When using `NaPlatform` widgets, you can pass common parameters (like `child`, `onPressed`) and define platform-specific options at runtime using the `optionsBuilder` function.
This pattern (based on Marker Interfaces) guarantees total Type Safety and perfect decoupling.

```dart
NaButton(
  onPressed: () => print('Pressed!'),
  optionsBuilder: (BuildContext context, NaUiType uiType) {
    // Specific options for Material
    if (uiType == NaUiType.material) {
      return NaButtonOptionsMaterial(
        autofocus: true,
        clipBehavior: Clip.hardEdge,
      );
    }
    
    // Options for third-party plugins (e.g. macos_ui)
    // if (uiType == macosUiType) {
    //   return MacosButtonOptions(useAcrylicEffect: true);
    // }
    
    return null;
  },
  child: const Text('Submit'),
)
```
This ensures that the widget remains clean and can accommodate configurations for UI plugins added in the future without needing to be modified.

### 3. Extending with External Libraries (Plugins)
The library uses a **Widget Builder Registry** that allows external packages to add support for new design systems (like `macos_ui`) dynamically.

Read the full guide and example here: [Extending the Platform with External Libraries](.doc/external-libraries.md)

### Technical Deep Dives
*   **[Development Guidelines](.docs/development-guidelines.md)**: Strict constraints, target platforms (iOS/Android), offline-first storage logic, dependencies (e.g., `nanna_flutter`), and Dart/Flutter coding styles.
