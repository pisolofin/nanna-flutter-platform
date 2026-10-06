import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/ui-type.model.dart';
import '../scopes/ui-type.scope.dart';
import '../models/selection-item.model.dart';

/// Builds the content widget for a Cupertino action or dialog item.
Widget _buildCupertinoActionContent<T>(NaSelectionItem<T> item) {
  final Widget titleWidget = (item.subtitle == null)
    ? item.title
    : Column(
        mainAxisSize: MainAxisSize.min,
        children    : [
          // Title
          item.title,
          // Spacing
          const SizedBox(height: 2.0),
          // Subtitle
          DefaultTextStyle(
            style: const TextStyle(
              fontSize: 13.0,
              color   : CupertinoColors.secondaryLabel,
            ),
            child: item.subtitle!,
          ),
        ],
      )
  ;

  if ((item.leading == null) && (item.trailing == null) && (!item.isSelected)) {
    return titleWidget;
  }

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize     : MainAxisSize.min,
    children         : [
      // Leading widget
      if (item.leading != null) ...[
        item.leading!,
        const SizedBox(width: 8.0),
      ],
      // Content title
      Flexible(child: titleWidget),
      // Selection checkmark
      if (item.isSelected) ...[
        const SizedBox(width: 8.0),
        const Icon(CupertinoIcons.checkmark, size: 18.0),
      ],
      // Trailing widget
      if ((!item.isSelected) && (item.trailing != null)) ...[
        const SizedBox(width: 8.0),
        item.trailing!,
      ],
    ],
  );
}

/// Displays Cupertino modal bottom sheet on mobile devices.
Future<T?> _showCupertinoMobileBottomSheetAsync<T>({
  required BuildContext context,
  required List<NaSelectionItem<T>> itemList,
  required Widget? title,
  required Widget? message,
  required Widget? cancelButton,
  required bool barrierDismissible,
  required Color? barrierColor,
  required bool useRootNavigator,
  required RouteSettings? routeSettings,
}) {
  final List<Widget> actionWidgetList = [];

  for (final NaSelectionItem<T> item in itemList) {
    actionWidgetList.add(
      CupertinoActionSheetAction(
        isDefaultAction    : item.isDefault,
        isDestructiveAction: item.isDestructive,
        onPressed          : !item.isEnabled
          ? () {}
          : () {
            item.onTap?.call();
            Navigator.of(context, rootNavigator: useRootNavigator).pop(item.value);
          },
        child: _buildCupertinoActionContent(item),
      ),
    );
  }

  Widget? cancelButtonWidget;
  if (cancelButton != null) {
    cancelButtonWidget = CupertinoActionSheetAction(
      isDefaultAction: true,
      onPressed      : () {
        Navigator.of(context, rootNavigator: useRootNavigator).pop();
      },
      child: cancelButton,
    );
  }

  return showCupertinoModalPopup<T>(
    context           : context,
    barrierDismissible: barrierDismissible,
    barrierColor      : barrierColor ?? kCupertinoModalBarrierColor,
    useRootNavigator  : useRootNavigator,
    routeSettings     : routeSettings,
    builder           : (BuildContext popupContext) {
      return CupertinoActionSheet(
        title       : title,
        message     : message,
        actions     : actionWidgetList,
        cancelButton: cancelButtonWidget,
      );
    },
  );
}

/// Displays Material modal bottom sheet on mobile devices.
Future<T?> _showMaterialMobileBottomSheetAsync<T>({
  required BuildContext context,
  required List<NaSelectionItem<T>> itemList,
  required Widget? title,
  required Widget? message,
  required Widget? cancelButton,
  required bool barrierDismissible,
  required Color? barrierColor,
  required bool useRootNavigator,
  required RouteSettings? routeSettings,
}) {
  return showModalBottomSheet<T>(
    context           : context,
    isDismissible     : barrierDismissible,
    isScrollControlled: true,
    useRootNavigator  : useRootNavigator,
    routeSettings     : routeSettings,
    barrierColor      : barrierColor,
    shape             : const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(16.0),
      ),
    ),
    builder: (BuildContext sheetContext) {
      final List<Widget> childrenList = [
        // Drag handle
        Center(
          child: Container(
            margin    : const EdgeInsets.symmetric(vertical: 8.0),
            width     : 32.0,
            height    : 4.0,
            decoration: BoxDecoration(
              color       : Theme.of(sheetContext).dividerColor,
              borderRadius: BorderRadius.circular(2.0),
            ),
          ),
        ),
        // Header
        if ((title != null) || (message != null)) ...[
          Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 12.0),
            child  : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize      : MainAxisSize.min,
              children          : [
                // Title
                if (title != null) ...[
                  DefaultTextStyle(
                    style: Theme.of(sheetContext).textTheme.titleLarge ?? const TextStyle(
                      fontSize  : 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    child: title,
                  ),
                ],
                // Message
                if (message != null) ...[
                  if (title != null) ...[
                    const SizedBox(height: 4.0),
                  ],
                  DefaultTextStyle(
                    style: Theme.of(sheetContext).textTheme.bodyMedium ?? const TextStyle(
                      fontSize: 14.0,
                    ),
                    child: message,
                  ),
                ],
              ],
            ),
          ),
        ],
        // Selection items list
        Flexible(
          child: ListView.builder(
            shrinkWrap : true,
            itemCount  : itemList.length,
            itemBuilder: (BuildContext listContext, int index) {
              final NaSelectionItem<T> item = itemList[index];
              final Widget? trailingWidget = item.trailing ?? (item.isSelected ? const Icon(Icons.check) : null);

              return ListTile(
                leading : item.leading,
                title   : item.title,
                subtitle: item.subtitle,
                trailing: trailingWidget,
                enabled : item.isEnabled,
                onTap   : !item.isEnabled
                  ? null
                  : () {
                    item.onTap?.call();
                    Navigator.of(sheetContext, rootNavigator: useRootNavigator).pop(item.value);
                  },
              );
            },
          ),
        ),
        // Cancel button
        if (cancelButton != null) ...[
          const Divider(height: 1.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child  : SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.of(sheetContext, rootNavigator: useRootNavigator).pop();
                },
                child: cancelButton,
              ),
            ),
          ),
        ],
      ];

      return SafeArea(
        top  : false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children    : childrenList,
        ),
      );
    },
  );
}

/// Displays Cupertino modal dialog on tablet devices.
Future<T?> _showCupertinoTabletDialogAsync<T>({
  required BuildContext context,
  required List<NaSelectionItem<T>> itemList,
  required Widget? title,
  required Widget? message,
  required Widget? cancelButton,
  required bool barrierDismissible,
  required String? barrierLabel,
  required bool useRootNavigator,
  required RouteSettings? routeSettings,
}) {
  final List<Widget> actionWidgetList = [];

  for (final NaSelectionItem<T> item in itemList) {
    actionWidgetList.add(
      CupertinoDialogAction(
        isDefaultAction    : item.isDefault,
        isDestructiveAction: item.isDestructive,
        onPressed          : !item.isEnabled
          ? () {}
          : () {
            item.onTap?.call();
            Navigator.of(context, rootNavigator: useRootNavigator).pop(item.value);
          },
        child: _buildCupertinoActionContent(item),
      ),
    );
  }

  if (cancelButton != null) {
    actionWidgetList.add(
      CupertinoDialogAction(
        isDefaultAction: true,
        onPressed      : () {
          Navigator.of(context, rootNavigator: useRootNavigator).pop();
        },
        child: cancelButton,
      ),
    );
  }

  return showCupertinoDialog<T>(
    context           : context,
    barrierDismissible: barrierDismissible,
    barrierLabel      : barrierLabel,
    useRootNavigator  : useRootNavigator,
    routeSettings     : routeSettings,
    builder           : (BuildContext dialogContext) {
      return CupertinoAlertDialog(
        title  : title,
        content: message,
        actions: actionWidgetList,
      );
    },
  );
}

/// Displays Material modal dialog on tablet devices.
Future<T?> _showMaterialTabletDialogAsync<T>({
  required BuildContext context,
  required List<NaSelectionItem<T>> itemList,
  required Widget? title,
  required Widget? message,
  required Widget? cancelButton,
  required bool barrierDismissible,
  required Color? barrierColor,
  required String? barrierLabel,
  required bool useRootNavigator,
  required RouteSettings? routeSettings,
}) {
  return showDialog<T>(
    context           : context,
    barrierDismissible: barrierDismissible,
    barrierColor      : barrierColor,
    barrierLabel      : barrierLabel,
    useRootNavigator  : useRootNavigator,
    routeSettings     : routeSettings,
    builder           : (BuildContext dialogContext) {
      final List<Widget> childrenList = [
        // Message description
        if (message != null) ...[
          Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 12.0),
            child  : message,
          ),
        ],
        // Selection options
        for (final NaSelectionItem<T> item in itemList) ...[
          SimpleDialogOption(
            onPressed: !item.isEnabled
              ? null
              : () {
                item.onTap?.call();
                Navigator.of(dialogContext, rootNavigator: useRootNavigator).pop(item.value);
              },
            child: Row(
              children: [
                // Leading widget
                if (item.leading != null) ...[
                  item.leading!,
                  const SizedBox(width: 16.0),
                ],
                // Title and subtitle
                Expanded(
                  child: (item.subtitle == null)
                    ? item.title
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize      : MainAxisSize.min,
                        children          : [
                          // Title
                          item.title,
                          // Spacing
                          const SizedBox(height: 2.0),
                          // Subtitle
                          DefaultTextStyle(
                            style: Theme.of(dialogContext).textTheme.bodySmall ?? const TextStyle(fontSize: 12.0),
                            child: item.subtitle!,
                          ),
                        ],
                      ),
                ),
                // Selected checkmark
                if (item.isSelected) ...[
                  const SizedBox(width: 8.0),
                  const Icon(Icons.check, size: 20.0),
                ],
                // Trailing widget
                if ((!item.isSelected) && (item.trailing != null)) ...[
                  const SizedBox(width: 8.0),
                  item.trailing!,
                ],
              ],
            ),
          ),
        ],
        // Cancel button
        if (cancelButton != null) ...[
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child  : Align(
              alignment: Alignment.centerRight,
              child    : TextButton(
                onPressed: () {
                  Navigator.of(dialogContext, rootNavigator: useRootNavigator).pop();
                },
                child: cancelButton,
              ),
            ),
          ),
        ],
      ];

      return SimpleDialog(
        title: title,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        children: childrenList,
      );
    },
  );
}

/// Displays a platform-adaptive selection modal or bottom sheet according to the active [NaUiType] and device size.
///
/// On mobile devices (phones):
/// - Cupertino: Opens a bottom sheet via [showCupertinoModalPopup] with a [CupertinoActionSheet].
/// - Material: Opens a bottom sheet via [showModalBottomSheet] with a list of selection items.
///
/// On tablet devices ([MediaQueryData.size.shortestSide] >= [tabletBreakpoint]):
/// - Cupertino: Opens a modal dialog via [showCupertinoDialog] with a [CupertinoAlertDialog].
/// - Material: Opens a modal dialog via [showDialog] with a [SimpleDialog].
Future<T?> naShowSelectionModalAsync<T>({
  required BuildContext context,
  required List<NaSelectionItem<T>> itemList,
  Widget? title,
  String? titleText,
  Widget? message,
  String? messageText,
  Widget? cancelButton,
  String? cancelText,
  double tabletBreakpoint = 600.0,
  bool barrierDismissible = true,
  Color? barrierColor,
  String? barrierLabel,
  bool useRootNavigator = true,
  RouteSettings? routeSettings,
  bool? isTablet,
  NaUiType? forceUiType,
}) async {
  // Resolve title widget
  Widget? resolvedTitle = title;
  if ((resolvedTitle == null) && (titleText != null)) {
    resolvedTitle = Text(titleText);
  }

  // Resolve message widget
  Widget? resolvedMessage = message;
  if ((resolvedMessage == null) && (messageText != null)) {
    resolvedMessage = Text(messageText);
  }

  // Resolve cancel button widget
  Widget? resolvedCancelButton = cancelButton;
  if ((resolvedCancelButton == null) && (cancelText != null)) {
    resolvedCancelButton = Text(cancelText);
  }

  // Detect tablet or phone
  final MediaQueryData mediaQueryData = MediaQuery.of(context);
  final bool resolvedIsTablet = isTablet ?? (mediaQueryData.size.shortestSide >= tabletBreakpoint);

  // Resolve active UI type
  NaUiType activeUiType = forceUiType ?? NaUiType.material;
  if (forceUiType == null) {
    final List<NaUiType> uiTypeList = NaUiTypeScope.of(context);
    for (final NaUiType type in uiTypeList) {
      if (type == NaUiType.cupertino) {
        activeUiType = NaUiType.cupertino;
        break;
      }
      if (type == NaUiType.material) {
        activeUiType = NaUiType.material;
        break;
      }
    }
  }

  if (resolvedIsTablet) {
    // Tablet modal dialog
    if (activeUiType == NaUiType.cupertino) {
      return _showCupertinoTabletDialogAsync<T>(
        context           : context,
        itemList          : itemList,
        title             : resolvedTitle,
        message           : resolvedMessage,
        cancelButton      : resolvedCancelButton,
        barrierDismissible: barrierDismissible,
        barrierLabel      : barrierLabel,
        useRootNavigator  : useRootNavigator,
        routeSettings     : routeSettings,
      );
    }

    return _showMaterialTabletDialogAsync<T>(
      context           : context,
      itemList          : itemList,
      title             : resolvedTitle,
      message           : resolvedMessage,
      cancelButton      : resolvedCancelButton,
      barrierDismissible: barrierDismissible,
      barrierColor      : barrierColor,
      barrierLabel      : barrierLabel,
      useRootNavigator  : useRootNavigator,
      routeSettings     : routeSettings,
    );
  }

  // Mobile bottom sheet
  if (activeUiType == NaUiType.cupertino) {
    return _showCupertinoMobileBottomSheetAsync<T>(
      context           : context,
      itemList          : itemList,
      title             : resolvedTitle,
      message           : resolvedMessage,
      cancelButton      : resolvedCancelButton,
      barrierDismissible: barrierDismissible,
      barrierColor      : barrierColor,
      useRootNavigator  : useRootNavigator,
      routeSettings     : routeSettings,
    );
  }

  return _showMaterialMobileBottomSheetAsync<T>(
    context           : context,
    itemList          : itemList,
    title             : resolvedTitle,
    message           : resolvedMessage,
    cancelButton      : resolvedCancelButton,
    barrierDismissible: barrierDismissible,
    barrierColor      : barrierColor,
    useRootNavigator  : useRootNavigator,
    routeSettings     : routeSettings,
  );
}
