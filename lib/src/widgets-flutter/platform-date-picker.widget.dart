import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/ui-type.model.dart';
import '../models/widget-options.model.dart';
import '../widgets/platform-widget.widget.dart';

/// Base options for [NaPlatformDatePicker].
abstract class NaPlatformDatePickerOptions extends NaWidgetOptions {}

/// Material-specific options for [NaPlatformDatePicker], resolving into a [CalendarDatePicker].
class NaPlatformDatePickerOptionsMaterial extends NaPlatformDatePickerOptions {
  final DateTime? currentDate;
  final ValueChanged<DateTime>? onDisplayedMonthChanged;
  final DatePickerMode? initialCalendarMode;
  final SelectableDayPredicate? selectableDayPredicate;
  
  NaPlatformDatePickerOptionsMaterial({
    this.currentDate,
    this.onDisplayedMonthChanged,
    this.initialCalendarMode,
    this.selectableDayPredicate,
  });
}

/// Cupertino-specific options for [NaPlatformDatePicker], resolving into a [CupertinoDatePicker].
class NaPlatformDatePickerOptionsCupertino extends NaPlatformDatePickerOptions {
  final double? itemExtent;
  final Widget? selectionOverlay;
  final Color? backgroundColor;
  final bool? use24hFormat;
  final int? minuteInterval;
  
  NaPlatformDatePickerOptionsCupertino({
    this.itemExtent,
    this.selectionOverlay,
    this.backgroundColor,
    this.use24hFormat,
    this.minuteInterval,
  });
}

/// A generic DatePicker widget that automatically renders a [CalendarDatePicker] on Material 
/// and a [CupertinoDatePicker] on Cupertino.
class NaPlatformDatePicker extends NaPlatformWidget {
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final ValueChanged<DateTime> onDateChanged;

  final NaWidgetOptionsBuilder<NaPlatformDatePickerOptions>? optionsBuilder;

  const NaPlatformDatePicker({
    super.key,
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
    required this.onDateChanged,
    this.optionsBuilder,
    super.uiType,
  });

  @override
  Widget renderForUIType(BuildContext context, NaUiType uiType) {
    final NaPlatformDatePickerOptions? options = optionsBuilder?.call(
      context,
      uiType,
    );

    if (uiType == NaUiType.cupertino) {
      final NaPlatformDatePickerOptionsCupertino? cupertinoOptions = options is NaPlatformDatePickerOptionsCupertino ? options : null;
      return SizedBox(
        height: 216.0,
        child: CupertinoDatePicker(
          mode              : CupertinoDatePickerMode.date,
          initialDateTime   : this.initialDate,
          minimumDate       : this.firstDate,
          maximumDate       : this.lastDate,
          onDateTimeChanged : this.onDateChanged,
          itemExtent        : cupertinoOptions?.itemExtent ?? 32.0,
          use24hFormat      : cupertinoOptions?.use24hFormat ?? false,
          minuteInterval    : cupertinoOptions?.minuteInterval ?? 1,
          backgroundColor   : cupertinoOptions?.backgroundColor,
        ),
      );
    }

    final NaPlatformDatePickerOptionsMaterial? materialOptions = options is NaPlatformDatePickerOptionsMaterial ? options : null;
    return CalendarDatePicker(
      initialDate            : this.initialDate,
      firstDate              : this.firstDate,
      lastDate               : this.lastDate,
      onDateChanged          : this.onDateChanged,
      currentDate            : materialOptions?.currentDate,
      onDisplayedMonthChanged: materialOptions?.onDisplayedMonthChanged,
      initialCalendarMode    : materialOptions?.initialCalendarMode ?? DatePickerMode.day,
      selectableDayPredicate : materialOptions?.selectableDayPredicate,
    );
  }
}
