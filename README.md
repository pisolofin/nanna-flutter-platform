# nanna_flutter_platform

This library provides unified cross-platform components for Flutter apps.
Instead of writing platform-conditional code (`if (Platform.isIOS) ...`) on every screen, `nanna_flutter_platform` exposes generic widgets (like `NaPlatformButton`) that automatically translate into the appropriate native design system:
- **Material Design** for Android, Web, and Linux
- **Cupertino** for iOS and macOS
- **Fluent UI** for Windows

## Supported Widgets Status

| Flutter Widget (Material) | Cupertino Equivalent | Fluent UI Equivalent | Implemented | Component Name |
| --- | --- | --- | :---: | --- |
| `MaterialApp` | `CupertinoApp` | `FluentApp` | ✅ | `NaPlatformApp` |
| `Scaffold` | `CupertinoPageScaffold` | `ScaffoldPage` | ✅ | `NaPlatformScaffold` |
| `AppBar` | `CupertinoNavigationBar`| `PageHeader` | ✅ | `NaPlatformAppBar` |
| `ElevatedButton` | `CupertinoButton` | `Button` | ✅ | `NaPlatformButton` |
| `IconButton` | `CupertinoButton` (icon) | `IconButton` | ❌ | `NaPlatformIconButton` |
| `TextField` | `CupertinoTextField` | `TextBox` | ❌ | `NaPlatformTextField` |
| `Switch` | `CupertinoSwitch` | `ToggleSwitch` | ❌ | `NaPlatformSwitch` |
| `Checkbox` | `CupertinoCheckbox` | `Checkbox` | ❌ | `NaPlatformCheckbox` |
| `Slider` | `CupertinoSlider` | `Slider` | ❌ | `NaPlatformSlider` |
| `CircularProgressIndicator`| `CupertinoActivityIndicator`| `ProgressRing` | ❌ | `NaPlatformProgressIndicator` |
| `Card` | `Container` (decorated) | `Card` | ❌ | `NaPlatformCard` |
| `AlertDialog` | `CupertinoAlertDialog` | `ContentDialog` | ❌ | `NaPlatformAlertDialog` |
| `BottomNavigationBar` | `CupertinoTabBar` | `NavigationView` | ❌ | `NaPlatformBottomNavigationBar` |
| `DatePicker` | `CupertinoDatePicker` | `DatePicker` | ❌ | `NaPlatformDatePicker` |
| `TimePicker` | `CupertinoTimerPicker` | `TimePicker` | ❌ | `NaPlatformTimePicker` |
| `ListTile` | `CupertinoListTile` | `ListTile` | ❌ | `NaPlatformListTile` |
| `Radio` | `CupertinoRadio` | `RadioButton` | ❌ | `NaPlatformRadio` |
| `Dialog Action` | `CupertinoDialogAction` | `Button` (in dialog) | ❌ | `NaPlatformDialogAction` |


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
NaPlatformButton(
  onPressed: () => print('Pressed!'),
  optionsBuilder: (BuildContext context, NaUiType uiType) {
    // Specific options for Material
    if (uiType == NaUiType.material) {
      return NaPlatformButtonOptionsMaterial(
        autofocus: true,
        clipBehavior: Clip.hardEdge,
      );
    }
    
    // Options for third-party plugins (e.g. Fluent UI)
    // if (uiType == fluentUiType) {
    //   return FluentButtonOptions(useAcrylicEffect: true);
    // }
    
    return null;
  },
  child: const Text('Submit'),
)
```
This ensures that the widget remains clean and can accommodate configurations for UI plugins added in the future without needing to be modified.

### 3. Extending with External Libraries (Plugins)
The library uses a **Widget Builder Registry** that allows external packages to add support for new design systems (like `fluent_ui` or `macos_ui`) dynamically.

Read the full guide and example here: [Extending the Platform with External Libraries](.doc/external_libraries.md)

### Technical Deep Dives
*   **[Development Guidelines](.docs/development-guidelines.md)**: Strict constraints, target platforms (iOS/Android), offline-first storage logic, dependencies (e.g., `nanna_flutter`), and Dart/Flutter coding styles.
