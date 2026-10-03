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

  /// Creates an empty [NaDatePickerOptionsMaterial] with default values.
  NaDatePickerOptionsMaterial.empty() : this();

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

  /// Creates an empty [NaDatePickerOptionsCupertino] with default values.
  NaDatePickerOptionsCupertino.empty() : this();

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
