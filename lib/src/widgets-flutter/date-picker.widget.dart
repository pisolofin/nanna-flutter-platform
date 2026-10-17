import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/ui-type.model.dart';
import '../widgets/na-widget.widget.dart';
import '../models/widget-options.model.dart';

/// Base options for [NaDatePicker].
abstract class NaDatePickerOptions extends NaWidgetOptions {
  /// Default constructor for subclasses.
  NaDatePickerOptions();

  /// Creates an empty [NaDatePickerOptions] with default values.
  factory NaDatePickerOptions.empty() => NaDatePickerOptionsGeneric.empty();
}

/// Generic options for [NaDatePicker], holding properties common to both platforms.
class NaDatePickerOptionsGeneric extends NaDatePickerOptions {
  /// Creates a [NaDatePickerOptionsGeneric].
  NaDatePickerOptionsGeneric();

  /// Creates an empty [NaDatePickerOptionsGeneric] with default values.
  NaDatePickerOptionsGeneric.empty() : this();

  /// Creates a copy of this [NaDatePickerOptionsGeneric].
  NaDatePickerOptionsGeneric copyWith() {
    return NaDatePickerOptionsGeneric();
  }
}

/// Material-specific options for [NaDatePicker], resolving into a [CalendarDatePicker].
class NaDatePickerOptionsMaterial extends NaDatePickerOptionsGeneric {
  /// The currently selected date.
  final DateTime? currentDate;
  /// Called when the user navigates to a new month.
  final ValueChanged<DateTime>? onDisplayedMonthChanged;
  /// The initial mode of the calendar date picker.
  final DatePickerMode? initialCalendarMode;
  /// Function to provide full control over which dates are selectable.
  final SelectableDayPredicate? selectableDayPredicate;

  /// Creates a [NaDatePickerOptionsMaterial].
  NaDatePickerOptionsMaterial({
    this.currentDate,
    this.onDisplayedMonthChanged,
    this.initialCalendarMode,
    this.selectableDayPredicate,
  });

  /// Creates an empty [NaDatePickerOptionsMaterial] with default values.
  NaDatePickerOptionsMaterial.empty() : this();

  /// Creates a [NaDatePickerOptionsMaterial] from generic options.
  NaDatePickerOptionsMaterial.fromGeneric(
    NaDatePickerOptionsGeneric? generic, {
    this.currentDate,
    this.onDisplayedMonthChanged,
    this.initialCalendarMode,
    this.selectableDayPredicate,
  }) : super();

  /// Creates a copy of this [NaDatePickerOptionsMaterial] with the given fields replaced by non-null values.
  @override
  NaDatePickerOptionsMaterial copyWith({
    DateTime? currentDate,
    ValueChanged<DateTime>? onDisplayedMonthChanged,
    DatePickerMode? initialCalendarMode,
    SelectableDayPredicate? selectableDayPredicate,
  }) {
    return NaDatePickerOptionsMaterial(
      currentDate            : currentDate ?? this.currentDate,
      onDisplayedMonthChanged: onDisplayedMonthChanged ?? this.onDisplayedMonthChanged,
      initialCalendarMode    : initialCalendarMode ?? this.initialCalendarMode,
      selectableDayPredicate : selectableDayPredicate ?? this.selectableDayPredicate,
    );
  }
}

/// Cupertino-specific options for [NaDatePicker], resolving into a [CupertinoDatePicker].
class NaDatePickerOptionsCupertino extends NaDatePickerOptionsGeneric {
  /// The uniform height of each item in the picker.
  final double? itemExtent;
  /// Custom widget for the selection overlay in the picker.
  final Widget? selectionOverlay;
  /// The background color of this widget.
  final Color? backgroundColor;
  /// Whether to use 24-hour time format.
  final bool? use24hFormat;
  /// The granularity of the minutes display.
  final int? minuteInterval;

  /// Creates a [NaDatePickerOptionsCupertino].
  NaDatePickerOptionsCupertino({
    this.itemExtent,
    this.selectionOverlay,
    this.backgroundColor,
    this.use24hFormat,
    this.minuteInterval,
  });

  /// Creates an empty [NaDatePickerOptionsCupertino] with default values.
  NaDatePickerOptionsCupertino.empty() : this();

  /// Creates a [NaDatePickerOptionsCupertino] from generic options.
  NaDatePickerOptionsCupertino.fromGeneric(
    NaDatePickerOptionsGeneric? generic, {
    this.itemExtent,
    this.selectionOverlay,
    this.backgroundColor,
    this.use24hFormat,
    this.minuteInterval,
  }) : super();

  /// Creates a copy of this [NaDatePickerOptionsCupertino] with the given fields replaced by non-null values.
  @override
  NaDatePickerOptionsCupertino copyWith({
    double? itemExtent,
    Widget? selectionOverlay,
    Color? backgroundColor,
    bool? use24hFormat,
    int? minuteInterval,
  }) {
    return NaDatePickerOptionsCupertino(
      itemExtent      : itemExtent ?? this.itemExtent,
      selectionOverlay: selectionOverlay ?? this.selectionOverlay,
      backgroundColor : backgroundColor ?? this.backgroundColor,
      use24hFormat    : use24hFormat ?? this.use24hFormat,
      minuteInterval  : minuteInterval ?? this.minuteInterval,
    );
  }
}

/// A generic DatePicker widget that automatically renders a [CalendarDatePicker] on Material
/// and a [CupertinoDatePicker] on Cupertino.
class NaDatePicker extends NaWidget {
  /// The date initially selected.
  final DateTime initialDate;
  /// The earliest allowable date.
  final DateTime firstDate;
  /// The latest allowable date.
  final DateTime lastDate;
  /// Called when the user selects a date.
  final ValueChanged<DateTime> onDateChanged;

  /// Optional options builder for customizing platform-specific widget configuration.
  final NaWidgetOptionsBuilder<NaDatePickerOptions>? optionsBuilder;

  /// Creates a [NaDatePicker].
  const NaDatePicker({
    super.key,
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
    required this.onDateChanged,
    this.optionsBuilder,
    super.uiType,
  });

  /// Creates a copy of this [NaDatePicker] with the given fields replaced by non-null values.
  NaDatePicker copyWith({
    Key? key,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
    ValueChanged<DateTime>? onDateChanged,
    NaWidgetOptionsBuilder<NaDatePickerOptions>? optionsBuilder,
    NaUiType? uiType,
  }) {
    return NaDatePicker(
      key           : key ?? this.key,
      initialDate   : initialDate ?? this.initialDate,
      firstDate     : firstDate ?? this.firstDate,
      lastDate      : lastDate ?? this.lastDate,
      onDateChanged : onDateChanged ?? this.onDateChanged,
      optionsBuilder: optionsBuilder ?? this.optionsBuilder,
      uiType        : uiType ?? this.uiType,
    );
  }

  @override
  Widget? renderForUIType(BuildContext context, NaUiType uiType) {
    final NaDatePickerOptions? options = optionsBuilder?.call(context, uiType);

    if (uiType == NaUiType.cupertino) {
      final NaDatePickerOptionsCupertino? cupertinoOptions = options is NaDatePickerOptionsCupertino
        ? options
        : null
      ;
      return SizedBox(
        height: 216.0,
        child : CupertinoDatePicker(
          mode             : CupertinoDatePickerMode.date,
          initialDateTime  : this.initialDate,
          minimumDate      : this.firstDate,
          maximumDate      : this.lastDate,
          onDateTimeChanged: this.onDateChanged,
          itemExtent       : cupertinoOptions?.itemExtent ?? 32.0,
          use24hFormat     : cupertinoOptions?.use24hFormat ?? false,
          minuteInterval   : cupertinoOptions?.minuteInterval ?? 1,
          backgroundColor  : cupertinoOptions?.backgroundColor,
        ),
      );
    }

    if (uiType == NaUiType.material) {
      final NaDatePickerOptionsMaterial? materialOptions = options is NaDatePickerOptionsMaterial
        ? options
        : null
      ;
      return CalendarDatePicker(
        initialDate            : this.initialDate,
        firstDate              : this.firstDate,
        lastDate               : this.lastDate,
        onDateChanged          : this.onDateChanged,
        currentDate            : materialOptions?.currentDate,
        onDisplayedMonthChanged: materialOptions?.onDisplayedMonthChanged,
        initialCalendarMode    :
            materialOptions?.initialCalendarMode ?? DatePickerMode.day,
        selectableDayPredicate: materialOptions?.selectableDayPredicate,
      );
    }

    return null;
  }
}
