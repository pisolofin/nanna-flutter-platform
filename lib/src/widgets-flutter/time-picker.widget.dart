import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/ui-type.model.dart';
import '../widgets/na-widget.widget.dart';
import '../models/widget-options.model.dart';

/// Base options for [NaTimePicker].
abstract class NaTimePickerOptions extends NaWidgetOptions {}

/// Material-specific options for [NaTimePicker], resolving into a [TimePickerDialog].
class NaTimePickerOptionsMaterial extends NaTimePickerOptions {
  final String? cancelText;
  final String? confirmText;
  final String? helpText;
  final String? errorInvalidText;
  final String? hourLabelText;
  final String? minuteLabelText;
  final TimePickerEntryMode? initialEntryMode;
  final Orientation? orientation;

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
}

/// Cupertino-specific options for [NaTimePicker], resolving into a [CupertinoTimerPicker].
class NaTimePickerOptionsCupertino extends NaTimePickerOptions {
  final CupertinoTimerPickerMode? mode;
  final int? minuteInterval;
  final int? secondInterval;
  final AlignmentGeometry? alignment;
  final Color? backgroundColor;
  final double? itemExtent;

  NaTimePickerOptionsCupertino({
    this.mode,
    this.minuteInterval,
    this.secondInterval,
    this.alignment,
    this.backgroundColor,
    this.itemExtent,
  });
}

/// A generic TimePicker widget that automatically renders a [TimePickerDialog] on Material
/// and a [CupertinoTimerPicker] on Cupertino.
///
/// NOTE: Because Flutter Material only exposes the TimePicker as a Dialog ([TimePickerDialog]),
/// using this widget inline on Material will render a Dialog widget directly in your tree.
/// It is recommended to use this widget inside a dialog wrapper.
class NaTimePicker extends NaWidget {
  final Duration initialTimerDuration;
  final ValueChanged<Duration> onTimerDurationChanged;

  final NaWidgetOptionsBuilder<NaTimePickerOptions>? optionsBuilder;

  const NaTimePicker({
    super.key,
    this.initialTimerDuration = Duration.zero,
    required this.onTimerDurationChanged,
    this.optionsBuilder,
    super.uiType,
  });

  @override
  Widget renderForUIType(BuildContext context, NaUiType uiType) {
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
}
