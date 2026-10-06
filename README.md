<p align="center">
  <img src="https://raw.githubusercontent.com/pisolofin/nanna-flutter-platform/main/.logo/nanna-platform-logo-transparent.png" alt="Nanna Platform Logo" width="200"/>
</p>

# nanna_platform

This library provides unified cross-platform components for Flutter apps.
Instead of writing platform-conditional code (`if (Platform.isIOS) ...`) on every screen, `nanna_platform` exposes generic widgets (like `NaButton`) that automatically translate into the appropriate native design system:
- **Material Design** for Android, Web, and Linux
- **Cupertino** for iOS and macOS
- **Custom Design Systems** (via dynamic widget builder plugins)

## Visual Comparison
Below are side-by-side examples of the exact same code rendering automatically in Material Design (Android) and Cupertino (iOS).

<table align="center">
  <tr>
    <td align="center"><strong>Android (Material)</strong></td>
    <td align="center"><strong>iPhone (Cupertino)</strong></td>
  </tr>
  <tr>
    <td><img src="https://raw.githubusercontent.com/pisolofin/nanna-flutter-platform/main/.doc/images/android-A.png" width="300" /></td>
    <td><img src="https://raw.githubusercontent.com/pisolofin/nanna-flutter-platform/main/.doc/images/iPhone-A.png" width="300" /></td>
  </tr>
  <tr>
    <td><img src="https://raw.githubusercontent.com/pisolofin/nanna-flutter-platform/main/.doc/images/android-B.png" width="300" /></td>
    <td><img src="https://raw.githubusercontent.com/pisolofin/nanna-flutter-platform/main/.doc/images/iPhone-B.png" width="300" /></td>
  </tr>
  <tr>
    <td><img src="https://raw.githubusercontent.com/pisolofin/nanna-flutter-platform/main/.doc/images/android-C.png" width="300" /></td>
    <td><img src="https://raw.githubusercontent.com/pisolofin/nanna-flutter-platform/main/.doc/images/iPhone-C.png" width="300" /></td>
  </tr>
  <tr>
    <td><img src="https://raw.githubusercontent.com/pisolofin/nanna-flutter-platform/main/.doc/images/android-D.png" width="300" /></td>
    <td><img src="https://raw.githubusercontent.com/pisolofin/nanna-flutter-platform/main/.doc/images/iPhone-D.png" width="300" /></td>
  </tr>
</table>

## Supported Widgets Status

| Flutter Widget (Material) | Cupertino Equivalent | Implemented | Component Name |
| --- | --- | :---: | --- |
| `MaterialApp` | `CupertinoApp` | ✅ | `NaApp` |
| `Scaffold` | `CupertinoPageScaffold` | ✅ | `NaScaffold` |
| `AppBar` | `CupertinoNavigationBar`| ✅ | `NaAppBar` |
| `ElevatedButton` | `CupertinoButton` | ✅ | `NaButton` |
| `FilledButton` | `CupertinoButton.filled` | ✅ | `NaButtonFilled` |
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
| `PageRoute` | `CupertinoPageRoute` | ✅ | `NaPageRoute` |
| `MaterialPage` | `CupertinoPage` | ✅ | `NaPage` |
| `Scrollbar` | `CupertinoScrollbar` | ✅ | `NaScrollbar` |
| `SearchBar` | `CupertinoSearchTextField`| ✅ | `NaSearchBar` |
| `TabBar` | `CupertinoTabBar` | ⏳ | `NaTabBar` |
| `TabBarView` | `CupertinoTabView` | ⏳ | `NaTabView` |
| `DropdownButton` | `CupertinoPicker` | ⏳ | `NaDropdown` |
| `RefreshIndicator` | `CupertinoSliverRefreshControl` | ⏳ | `NaRefreshIndicator` |
| `BottomSheet` | `CupertinoActionSheet` | ⏳ | `NaActionSheet` |

> 💡 **Icons Mapping**: For the full mapping table of all 10,000+ Material and Cupertino icons available via `NaIcons`, see [.doc/icons-mapping.md](.doc/icons-mapping.md).

### Composed Widgets

These widgets are not direct wrappers of native platform components, but rather compositions of multiple components to create ready-to-use UI elements.

| Component Name | Description | Implemented |
| --- | --- | :---: |
| `NaTextFieldCaption` | A `NaTextField` with a label placed above it. | ✅ |
| `NaTextFieldTitle` | A `NaTextField` wrapper with a conditional title that preserves layout space and provides custom border decoration. | ✅ |

## How to use the library

### 1. Initialize the Scope (NaUiTypeScope)
To make your entire app (or a portion of it) use a specific design system, wrap your widgets inside a `NaUiTypeScope`.
You can pass a fallback chain of UI types. The widgets will attempt to render themselves according to the first supported type in the list, falling back gracefully to the next ones if a custom style is not supported.

```dart
import 'package:flutter/widgets.dart';
import 'package:nanna_platform/nanna_platform.dart';

void main() {
  runApp(
    NaUiTypeScope(
      // Priority list of UI types (e.g., Cupertino first, falling back to Material)
      uiTypes: const [NaUiType.cupertino, NaUiType.material], 
      child  : const MyApp(),
    ),
  );
}
```

You can also inspect or resolve the active UI type from anywhere in the widget tree:

```dart
// Retrieve the active fallback chain
final List<NaUiType> uiTypeList = NaUiTypeScope.of(context);

// Resolve the active primary UI type
final NaUiType activeUiType = NaUiTypeScope.resolveUiType(context);

// Check if currently inside a Material or Cupertino scaffold
final bool isMaterial = NaUiTypeScope.isMaterial(context);
final bool isCupertino = NaUiTypeScope.isCupertino(context);
```

### 2. Create and use Widgets (Options Builder Pattern & Generic Options)
When using `NaPlatform` widgets, you can pass common parameters (like `child`, `onPressed`, `placeholder`) and customize behavior using `optionsBuilder`.

#### Generic Options (Cross-Platform)
To apply options across all supported platforms without branching, return generic options (e.g., `NaTextFieldOptionsGeneric`, `NaButtonOptionsGeneric`):

```dart
NaTextField(
  optionsBuilder: (BuildContext context, NaUiType uiType) => NaTextFieldOptionsGeneric(
    placeholder: 'Enter username',
    obscureText: false,
  ),
)
```

#### Platform-Specific Options
For fine-grained control, branch on `uiType`. You can create platform-specific options from generic ones using `.fromGeneric()` or mutate them with `.copyWith()`:

```dart
NaButton(
  onPressed     : () => print('Pressed!'),
  optionsBuilder: (BuildContext context, NaUiType uiType) {
    // Specific options for Material
    if (uiType == NaUiType.material) {
      return NaButtonOptionsMaterial(
        autofocus   : true,
        clipBehavior: Clip.hardEdge,
      );
    }
    
    // Options for Cupertino
    if (uiType == NaUiType.cupertino) {
      return NaButtonOptionsCupertino(
        pressedOpacity: 0.6,
      );
    }
    
    // Options for third-party plugins (e.g. macos_ui)
    // if (uiType == macosUiType) {
    //   return MacosButtonOptions(useAcrylicEffect: true);
    // }
    
    return null;
  },
  child         : const Text('Submit'),
)
```

Every options class also provides `.empty()` factory constructors and `.copyWith(...)` methods.

### 3. Navigation, Pages, Dialogs & Modals

#### Declarative Routing (NaApp.router & NaPage)
Use `NaApp.router` with declarative routing solutions such as **GoRouter**:

```dart
NaApp.router(
  routerConfig: myGoRouter,
  title       : 'My App',
)
```

Inside your route configurations, use `NaPage.create` to automatically produce `MaterialPage` or `CupertinoPage` transitions matching the active `NaUiType`:

```dart
GoRoute(
  path       : '/details',
  pageBuilder: (BuildContext context, GoRouterState state) => NaPage.create(
    context,
    child: const DetailsPage(),
  ),
);
```

#### Imperative Navigation (NaPageRoute)
To navigate imperatively with native transitions (such as iOS swipe-to-pop), use `NaPageRoute.create`:

```dart
Navigator.push(
  context,
  NaPageRoute.create(
    context, 
    builder: (context) => const MyNextPage(),
  ),
);
```

#### Native Alert Dialogs (naShowDialog)
To show a dialog with the correct native animations and styling (Material alert dialog vs Cupertino alert dialog), use `naShowDialog`:

```dart
naShowDialog(
  context: context,
  builder: (context) => NaAlertDialog(
    title  : const Text('Hello!'),
    content: const Text('This is a cross-platform alert dialog.'),
  ),
);
```

#### Adaptive Selection Modals (naShowSelectionModalAsync)
To display a selection sheet that automatically renders as an action sheet / bottom sheet on phones and as a modal dialog on tablets:

```dart
final String? selected = await naShowSelectionModalAsync<String>(
  context     : context,
  title       : const Text('Choose an Option'),
  message     : const Text('Select one of the available items:'),
  cancelButton: const Text('Cancel'),
  itemList    : [
    NaSelectionItem(
      value   : 'opt1',
      title   : const Text('First Option'),
      subtitle: const Text('Description for option 1'),
    ),
    NaSelectionItem(
      value   : 'opt2',
      title   : const Text('Second Option'),
      subtitle: const Text('Description for option 2'),
    ),
    const NaSelectionItem(
      value        : 'delete',
      title        : Text('Remove selection'),
      isDestructive: true,
    ),
  ],
);
```

### 4. Extending with External Libraries (Plugins)
The library uses a **Widget Builder Registry** that allows external packages to add support for new design systems (like `macos_ui`) dynamically.

Read the full guide and example here: [Extending the Platform with External Libraries](.doc/external-libraries.md)

### Technical Deep Dives
*   **[Development Guidelines](.doc/development-guidelines.md)**: Architectural constraints, design patterns, coding rules, and conventions for `nanna_platform`.
*   **[Icons Mapping](.doc/icons-mapping.md)**: Complete mapping table of all Flutter `Icons` (Material) and `CupertinoIcons` available in `NaIcons`.
