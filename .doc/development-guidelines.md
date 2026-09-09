# Development Guidelines & Architecture

This document outlines the technical architecture, design patterns, and coding conventions for the `nanna_platform` library.

## Core Architecture

`nanna_platform` provides platform-adaptive UI components for Flutter that seamlessly switch between **Material Design**, **Cupertino (iOS/macOS)**, and external custom design systems (e.g. `macos_ui`) via a decoupled architecture.

### 1. UI Type Resolution (`NaUiType` & `NaUiTypeScope`)
- **`NaUiType`**: Value object identifying design systems (built-in `none`, `material`, `cupertino`, and dynamically registered custom types).
- **`NaUiTypeScope`**: An `InheritedWidget` holding a prioritized fallback list (`uiTypes`). Descendant `NaWidget`s resolve the active UI type by iterating through this list until a supported rendering is found.

### 2. Base Widget Lifecycle (`NaWidget`)
Every platform-adaptive widget extends `NaWidget`:
- Overrides `Widget? renderForUIType(BuildContext context, NaUiType uiType)` to return the concrete platform widget (e.g., `ElevatedButton` for Material, `CupertinoButton` for Cupertino).
- Checks the `naPlatformServiceGetWidgetBuilder` registry first to allow external plugins to override or extend widget rendering dynamically.

### 3. Options Builder Pattern (`NaWidgetOptions`)
To maintain type safety without bloating common widget constructors with platform-specific properties:
- Define an abstract options class extending `NaWidgetOptions` (e.g., `NaButtonOptions`).
- Provide concrete platform implementations (e.g., `NaButtonOptionsMaterial`, `NaButtonOptionsCupertino`).
- Accept a runtime `NaWidgetOptionsBuilder<T>? optionsBuilder` in the widget constructor.

### 4. Dynamic Plugin Registry
- External UI packages register new styles and UI types via `naPlatformServiceRegisterUiType`.
- External widget builders are registered via `naPlatformServiceRegisterWidgetBuilder`.

---

## Coding Styles & Rules (Dart/Flutter)

### Naming Conventions
- **Strict English Naming**: Descriptive and unambiguous. No single-letter variables.
- **Lists**: Variables representing collections/lists must be singular and end with `List` (e.g., `widgetList`, `typeList`).
- **Asynchronous Methods**: Must have the `Async` suffix (e.g., `resolveBuilderAsync()`).

### Syntax & Formatting
- **Mandatory Braces & Multiline**: Always use curly braces `{}` for all `if`, `for`, and `while` blocks. The body must be on a new line; single-line blocks without braces are not allowed.
- **Condition Parentheses**: Wrap non-direct boolean conditions in parentheses when combining with logical operators (e.g., `if ((item == null) || (item.isEmpty))`).
- **Keyword Spacing**: No spaces before structural keywords preceded by a closing brace (e.g., `}else` and `}catch`).
- **Named Parameters Alignment**: Vertically align colons (`:`) using spaces when passing multiple named parameters to improve readability.
- **Method Chaining**: Chained method calls must be indented with 2 spaces relative to the root object, with the closing semicolon on its own line matching the root object indentation.

### Class Properties & Constructors
- Explicitly use `this.` to refer to public class properties in constructors and method signatures.
- Do **NOT** use `this.` for private variables or private methods (those starting with `_`).

### Imports Organization
Order of imports (separated by empty lines):
1. `import 'dart:...'`
2. `import 'package:...'`
3. Local project imports.

Within each group, sort imports by line length.

### File Naming & Project Structure
- File names must strictly use kebab-case (`-`), never snake_case (`_`).
- Naming pattern by layer:
  - `lib/src/models/*.model.dart`
  - `lib/src/scopes/*.scope.dart`
  - `lib/src/services/*.service.dart`
  - `lib/src/helpers/*.helper.dart`
  - `lib/src/constants/*.constant.dart`
  - `lib/src/exceptions/*.exception.dart`
  - `lib/src/widgets-flutter/*.widget.dart`
  - `lib/src/widgets/*.widget.dart`
- All exported public APIs must be registered in the barrel file `lib/nanna_platform.dart`.
- All files must end with an empty line.
