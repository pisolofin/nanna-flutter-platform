import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/ui-type.model.dart';
import '../widgets/na-widget.widget.dart';
import '../models/widget-options.model.dart';

/// Base options for [NaTimePicker].
abstract class NaTimePickerOptions extends NaWidgetOptions {
  /// Default constructor for subclasses.
  NaTimePickerOptions();

  /// Creates an empty [NaTimePickerOptions] with default values.
  factory NaTimePickerOptions.empty() => NaTimePickerOptionsGeneric.empty();
}

/// Generic options for [NaTimePicker], holding properties common to both platforms.
class NaTimePickerOptionsGeneric extends NaTimePickerOptions {
  /// Creates a [NaTimePickerOptionsGeneric].
  NaTimePickerOptionsGeneric();

  /// Creates an empty [NaTimePickerOptionsGeneric] with default values.
  NaTimePickerOptionsGeneric.empty() : this();

  /// Creates a copy of this [NaTimePickerOptionsGeneric].
  NaTimePickerOptionsGeneric copyWith() {
    return NaTimePickerOptionsGeneric();
  }
}

/// Material-specific options for [NaTimePicker], resolving into a [TimePickerDialog].
class NaTimePickerOptionsMaterial extends NaTimePickerOptionsGeneric {
  /// The text of the cancel button.
  final String? cancelText;
  /// The text of the confirm button.
  final String? confirmText;
  /// The text displayed at the top of the dialog.
  final String? helpText;
  /// The text displayed when an invalid value is entered.
  final String? errorInvalidText;
  /// The label for the hour input field.
  final String? hourLabelText;
  /// The label for the minute input field.
  final String? minuteLabelText;
  /// The initial entry mode for the time picker.
  final TimePickerEntryMode? initialEntryMode;
  /// The orientation layout for the picker.
  final Orientation? orientation;

  /// Creates a [NaTimePickerOptionsMaterial].
  NaTimePickerOptionsMaterial({
    this.cancelText,
    this.confirmText,
    this.helpText,
    this.errorInvalidText,
    this.hourLabelText,
    this.minuteLabelText,
    this.initialEntryMode,
    this.orientation,
  });

  /// Creates an empty [NaTimePickerOptionsMaterial] with default values.
  NaTimePickerOptionsMaterial.empty() : this();

  /// Creates a [NaTimePickerOptionsMaterial] from generic options.
  NaTimePickerOptionsMaterial.fromGeneric(
    NaTimePickerOptionsGeneric? generic, {
    this.cancelText,
    this.confirmText,
    this.helpText,
    this.errorInvalidText,
    this.hourLabelText,
    this.minuteLabelText,
    this.initialEntryMode,
    this.orientation,
  }) : super();

  /// Creates a copy of this [NaTimePickerOptionsMaterial] with the given fields replaced by non-null values.
  @override
  NaTimePickerOptionsMaterial copyWith({
    String? cancelText,
    String? confirmText,
    String? helpText,
    String? errorInvalidText,
    String? hourLabelText,
    String? minuteLabelText,
    TimePickerEntryMode? initialEntryMode,
    Orientation? orientation,
  }) {
    return NaTimePickerOptionsMaterial(
      cancelText      : cancelText ?? this.cancelText,
      confirmText     : confirmText ?? this.confirmText,
      helpText        : helpText ?? this.helpText,
      errorInvalidText: errorInvalidText ?? this.errorInvalidText,
      hourLabelText   : hourLabelText ?? this.hourLabelText,
      minuteLabelText : minuteLabelText ?? this.minuteLabelText,
      initialEntryMode: initialEntryMode ?? this.initialEntryMode,
      orientation     : orientation ?? this.orientation,
    );
  }
}

/// Cupertino-specific options for [NaTimePicker], resolving into a [CupertinoTimerPicker].
class NaTimePickerOptionsCupertino extends NaTimePickerOptionsGeneric {
  /// The timer picker display mode.
  final CupertinoTimerPickerMode? mode;
  /// The granularity of the minutes display.
  final int? minuteInterval;
  /// The granularity of the seconds display.
  final int? secondInterval;
  /// How the child is aligned within the widget.
  final AlignmentGeometry? alignment;
  /// The background color of this widget.
  final Color? backgroundColor;
  /// The uniform height of each item in the picker.
  final double? itemExtent;

  /// Creates a [NaTimePickerOptionsCupertino].
  NaTimePickerOptionsCupertino({
    this.mode,
    this.minuteInterval,
    this.secondInterval,
    this.alignment,
    this.backgroundColor,
    this.itemExtent,
  });

  /// Creates an empty [NaTimePickerOptionsCupertino] with default values.
  NaTimePickerOptionsCupertino.empty() : this();

  /// Creates a [NaTimePickerOptionsCupertino] from generic options.
  NaTimePickerOptionsCupertino.fromGeneric(
    NaTimePickerOptionsGeneric? generic, {
    this.mode,
    this.minuteInterval,
    this.secondInterval,
    this.alignment,
    this.backgroundColor,
    this.itemExtent,
  }) : super();

  /// Creates a copy of this [NaTimePickerOptionsCupertino] with the given fields replaced by non-null values.
  @override
  NaTimePickerOptionsCupertino copyWith({
    CupertinoTimerPickerMode? mode,
    int? minuteInterval,
    int? secondInterval,
    AlignmentGeometry? alignment,
    Color? backgroundColor,
    double? itemExtent,
  }) {
    return NaTimePickerOptionsCupertino(
      mode           : mode ?? this.mode,
      minuteInterval : minuteInterval ?? this.minuteInterval,
      secondInterval : secondInterval ?? this.secondInterval,
      alignment      : alignment ?? this.alignment,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      itemExtent     : itemExtent ?? this.itemExtent,
    );
  }
}

/// A generic TimePicker widget that automatically renders a [TimePickerDialog] on Material
/// and a [CupertinoTimerPicker] on Cupertino.
///
/// NOTE: Because Flutter Material only exposes the TimePicker as a Dialog ([TimePickerDialog]),
/// using this widget inline on Material will render a Dialog widget directly in your tree.
/// It is recommended to use this widget inside a dialog wrapper.
class NaTimePicker extends NaWidget {
  /// The initial duration of the timer picker.
  final Duration initialTimerDuration;
  /// Called when the timer duration changes.
  final ValueChanged<Duration> onTimerDurationChanged;

  /// Optional options builder for customizing platform-specific widget configuration.
  final NaWidgetOptionsBuilder<NaTimePickerOptions>? optionsBuilder;

  /// Creates a [NaTimePicker].
  const NaTimePicker({
    super.key,
    this.initialTimerDuration = Duration.zero,
    required this.onTimerDurationChanged,
    this.optionsBuilder,
    super.uiType,
  });

  /// Creates a copy of this [NaTimePicker] with the given fields replaced with the new values.
  NaTimePicker copyWith({
    Key? key,
    Duration? initialTimerDuration,
    ValueChanged<Duration>? onTimerDurationChanged,
    NaWidgetOptionsBuilder<NaTimePickerOptions>? optionsBuilder,
    NaUiType? uiType,
  }) {
    return NaTimePicker(
      key                   : key ?? this.key,
      initialTimerDuration  : initialTimerDuration ?? this.initialTimerDuration,
      onTimerDurationChanged: onTimerDurationChanged ?? this.onTimerDurationChanged,
      optionsBuilder        : optionsBuilder ?? this.optionsBuilder,
      uiType                : uiType ?? this.uiType,
    );
  }

  @override
  Widget? renderForUIType(BuildContext context, NaUiType uiType) {
    final NaTimePickerOptions? options = optionsBuilder?.call(context, uiType);

    if (uiType == NaUiType.cupertino) {
      final NaTimePickerOptionsCupertino? cupertinoOptions = options is NaTimePickerOptionsCupertino
        ? options
        : null
      ;
      return SizedBox(
        height: 216.0,
        child : CupertinoTimerPicker(
          mode                  : cupertinoOptions?.mode ?? CupertinoTimerPickerMode.hms,
          initialTimerDuration  : this.initialTimerDuration,
          minuteInterval        : cupertinoOptions?.minuteInterval ?? 1,
          secondInterval        : cupertinoOptions?.secondInterval ?? 1,
          alignment             : cupertinoOptions?.alignment ?? Alignment.center,
          backgroundColor       : cupertinoOptions?.backgroundColor,
          itemExtent            : cupertinoOptions?.itemExtent ?? 32.0,
          onTimerDurationChanged: this.onTimerDurationChanged,
        ),
      );
    }

    if (uiType == NaUiType.material) {
      final NaTimePickerOptionsMaterial? materialOptions = options is NaTimePickerOptionsMaterial
        ? options
        : null
      ;

      final TimeOfDay initialTime = TimeOfDay(
        hour  : this.initialTimerDuration.inHours % 24,
        minute: this.initialTimerDuration.inMinutes % 60,
      );

      return TimePickerDialog(
        initialTime     : initialTime,
        cancelText      : materialOptions?.cancelText,
        confirmText     : materialOptions?.confirmText,
        helpText        : materialOptions?.helpText,
        errorInvalidText: materialOptions?.errorInvalidText,
        hourLabelText   : materialOptions?.hourLabelText,
        minuteLabelText : materialOptions?.minuteLabelText,
        initialEntryMode:
            materialOptions?.initialEntryMode ?? TimePickerEntryMode.dial,
      );
    }

    return null;
  }
}
