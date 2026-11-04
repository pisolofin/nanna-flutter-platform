## 1.2.3

* Enhanced `NaApp` to preserve ancestor `NaUiTypeScope` fallback chains instead of overwriting them with a single `uiType`.
* Added `uiTypes` parameter to `NaApp` and `NaApp.router` constructors and `copyWith` method to define explicit fallback chains.
* Enhanced `NaApp.build` to resolve and render across the `uiTypes` fallback chain when `uiType` is omitted.
* Added unit tests verifying `NaApp` scope inheritance and `uiTypes` propagation.

## 1.2.2

* Refined `NaCard` visual defaults across Material and Cupertino (zero outer margin, 12pt rounded corners, anti-aliased clipping, flat surface with crisp 0.5pt hairline border) and added direct `padding` parameter plus cross-platform `padding`, `borderRadius`, `borderColor`, `borderWidth`, and `clipBehavior` options in `NaCardOptionsGeneric`.
* Fixed service initialization crash in `naPlatformServiceInit` and `naPlatformServiceRegisterUiType`.
* Added `naPlatformServiceResetUiTypes()` and `naPlatformServiceResetWidgetBuilders()` for clean state resets in test environments.
* Added meaningful `toString()` implementation to `NaUiType`.
* Rebuilt `NaTimePicker` for Material Design as a native inline wheel duration picker with active `onTimerDurationChanged` callback support.
* Renamed `naShowDialog` to `naShowDialogAsync` to adhere to async naming conventions (retaining `naShowDialog` as a backward-compatible alias).
* Added `naShowActionSheetAsync` and `naShowBottomSheetAsync` aliases for `naShowSelectionModalAsync` for showing native iOS action sheets and Material bottom sheets.
* Enhanced `NaApp` to automatically propagate `NaUiTypeScope` to descendant widgets.
* Fixed `NaSearchBar` in Cupertino to preserve custom `NaIcon` and custom widget `leading`.
* Replaced hardcoded `Icon` instances in `show-selection-modal.helper.dart`, `list-tile.widget.dart`, and `search-bar.widget.dart` with `NaIcon`.
* Added configurable `position` (`above` / `below`) to `NaTextFieldCaption` and fixed typo in docstring.
* Added `copyWith` method to `NaSelectionItem`.
* Added Action Sheet / Bottom Menu showcase button and dialog in the example app.
* Hardened internal formatting scripts against directory symlinks (e.g. `example/windows/flutter/ephemeral/.plugin_symlinks`) preventing accidental modifications to pub cache.
* Added GitHub Actions CI workflow for automated testing and static analysis.
* Significantly expanded test coverage with 8 new test suites covering models, scopes, services, helpers, and widgets.

## 1.2.1
* Fix `NaAppBar` platform height

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

* First public release of nanna_platform.
