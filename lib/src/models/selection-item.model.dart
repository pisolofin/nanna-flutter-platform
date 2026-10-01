import 'package:flutter/widgets.dart';

/// Represents an item in a platform-adaptive selection modal or bottom sheet.
class NaSelectionItem<T> {
  /// The value associated with this selection item, returned when selected.
  final T value;

  /// The main content or title of the item.
  final Widget title;

  /// An optional subtitle or secondary description.
  final Widget? subtitle;

  /// An optional leading widget (e.g., icon or avatar).
  final Widget? leading;

  /// An optional trailing widget (e.g., badge or custom checkmark).
  final Widget? trailing;

  /// Whether this item represents a destructive action (styled in red on Cupertino).
  final bool isDestructive;

  /// Whether this item represents the default action (bold text on Cupertino).
  final bool isDefault;

  /// Whether this item is currently selected (displays checkmark).
  final bool isSelected;

  /// Whether this item is enabled and interactable.
  final bool isEnabled;

  /// Optional custom callback invoked when this item is tapped.
  final VoidCallback? onTap;

  /// Creates a cross-platform selection item.
  const NaSelectionItem({
    required this.value,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.isDestructive = false,
    this.isDefault = false,
    this.isSelected = false,
    this.isEnabled = true,
    this.onTap,
  });

  /// Convenience factory for creating a text-based selection item.
  factory NaSelectionItem.text({
    required T value,
    required String text,
    String? subtitleText,
    Widget? leading,
    Widget? trailing,
    bool isDestructive = false,
    bool isDefault = false,
    bool isSelected = false,
    bool isEnabled = true,
    VoidCallback? onTap,
  }) {
    return NaSelectionItem<T>(
      value        : value,
      title        : Text(text),
      subtitle     : (subtitleText != null) ? Text(subtitleText) : null,
      leading      : leading,
      trailing     : trailing,
      isDestructive: isDestructive,
      isDefault    : isDefault,
      isSelected   : isSelected,
      isEnabled    : isEnabled,
      onTap        : onTap,
    );
  }
}
