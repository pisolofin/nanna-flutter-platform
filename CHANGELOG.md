## 1.2.0

* Added `NaApp.router` to configure the router.
* Added `NaOptionsGeneric` to support common widget options.
* Added `NaButtonFilled` widget for cross-platform filled buttons (`FilledButton` and `CupertinoButton.filled`).
* Added `NaTextFieldTitle` widget for text fields with fixed-space conditional titles and custom border styling.

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
