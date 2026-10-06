## 1.2.0

* Added `NaApp.router` constructor to configure declarative routing using `routerConfig` (e.g., GoRouter) or custom router delegates.
* Added `NaPage` widget for cross-platform declarative page transitions (`MaterialPage` and `CupertinoPage`).
* Added `NaButtonFilled` widget for cross-platform filled buttons (`FilledButton` and `CupertinoButton.filled`).
* Added `NaTextFieldTitle` widget for text fields with fixed-space conditional titles, custom borders, and configurable `titlePosition` (`above` or `onBorder`).
* Added `naShowSelectionModalAsync` helper function and `NaSelectionItem` model for adaptive selection sheets and dialogs.
* Added `NaOptionsGeneric` system across all widgets for shared cross-platform options.
* Added `.fromGeneric()` factory constructors to all platform-specific option classes to derive configurations from generic options.
* Added `.empty()` constructors and `.copyWith()` methods to all widget option classes.
* Enhanced `NaUiTypeScope` with `NaUiTypeScope.of(context)`, `resolveUiType(context)`, and scaffold inspector methods.
* Fixed `NaTextField` vertical alignment when `obscureText` is enabled and fixed Cupertino border styling.

## 1.1.0

* Added `NaSearchBar` widget for Material and Cupertino search inputs.
* Added `naShowDialog` helper function for cross-platform dialog presentation.
* Exported `NaWidgetOptions` and `NaWidgetOptionsBuilder` in the public API.
* Added `NaIcons` class for cross-platform icon mapping.

## 1.0.2

* Cupertino icons dependency.
* Navigation (`NaPageRoute`).

## 1.0.1

* Added dynamic fallback engine for UI rendering with `NaUiTypeScope` and `uiTypes` chain.
* Migrated 19 foundational widgets (Button, TextField, Dialog, AppBar, Scaffold, etc.) to natively fallback between custom builder styles, Cupertino, and Material.

## 1.0.0

* Initial release of the `nanna_platform` package.
