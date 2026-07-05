import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/ui-type.model.dart';
import '../models/widget-options.model.dart';
import '../widgets/na-widget.widget.dart';

/// Base options for [NaDatePicker].
abstract class NaDatePickerOptions extends NaWidgetOptions {}

/// Material-specific options for [NaDatePicker], resolving into a [CalendarDatePicker].
class NaDatePickerOptionsMaterial extends NaDatePickerOptions {
  final DateTime? currentDate;
  final ValueChanged<DateTime>? onDisplayedMonthChanged;
  final DatePickerMode? initialCalendarMode;
  final SelectableDayPredicate? selectableDayPredicate;

  NaDatePickerOptionsMaterial({
    this.currentDate,
    this.onDisplayedMonthChanged,
    this.initialCalendarMode,
    this.selectableDayPredicate,
  });
}

/// Cupertino-specific options for [NaDatePicker], resolving into a [CupertinoDatePicker].
class NaDatePickerOptionsCupertino extends NaDatePickerOptions {
  final double? itemExtent;
  final Widget? selectionOverlay;
  final Color? backgroundColor;
  final bool? use24hFormat;
  final int? minuteInterval;

  NaDatePickerOptionsCupertino({
    this.itemExtent,
    this.selectionOverlay,
    this.backgroundColor,
    this.use24hFormat,
    this.minuteInterval,
  });
}

/// A generic DatePicker widget that automatically renders a [CalendarDatePicker] on Material
/// and a [CupertinoDatePicker] on Cupertino.
class NaDatePicker extends NaWidget {
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final ValueChanged<DateTime> onDateChanged;

  final NaWidgetOptionsBuilder<NaDatePickerOptions>? optionsBuilder;

  const NaDatePicker({
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
    final NaDatePickerOptions? options = optionsBuilder?.call(context, uiType);

    if (uiType == NaUiType.cupertino) {
      final NaDatePickerOptionsCupertino? cupertinoOptions =
          options is NaDatePickerOptionsCupertino ? options : null;
      return SizedBox(
        height: 216.0,
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          initialDateTime: this.initialDate,
          minimumDate: this.firstDate,
          maximumDate: this.lastDate,
          onDateTimeChanged: this.onDateChanged,
          itemExtent: cupertinoOptions?.itemExtent ?? 32.0,
          use24hFormat: cupertinoOptions?.use24hFormat ?? false,
          minuteInterval: cupertinoOptions?.minuteInterval ?? 1,
          backgroundColor: cupertinoOptions?.backgroundColor,
        ),
      );
    }

    final NaDatePickerOptionsMaterial? materialOptions =
        options is NaDatePickerOptionsMaterial ? options : null;
    return CalendarDatePicker(
      initialDate: this.initialDate,
      firstDate: this.firstDate,
      lastDate: this.lastDate,
      onDateChanged: this.onDateChanged,
      currentDate: materialOptions?.currentDate,
      onDisplayedMonthChanged: materialOptions?.onDisplayedMonthChanged,
      initialCalendarMode:
          materialOptions?.initialCalendarMode ?? DatePickerMode.day,
      selectableDayPredicate: materialOptions?.selectableDayPredicate,
    );
  }
}
