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
  /// The granularity of the minutes display.
  final int? minuteInterval;

  /// The granularity of the seconds display.
  final int? secondInterval;

  /// The uniform height of each item in the picker.
  final double? itemExtent;

  /// The background color of this widget.
  final Color? backgroundColor;

  /// Creates a [NaTimePickerOptionsGeneric].
  NaTimePickerOptionsGeneric({
    this.minuteInterval,
    this.secondInterval,
    this.itemExtent,
    this.backgroundColor,
  });

  /// Creates an empty [NaTimePickerOptionsGeneric] with default values.
  NaTimePickerOptionsGeneric.empty() : this();

  /// Creates a copy of this [NaTimePickerOptionsGeneric].
  NaTimePickerOptionsGeneric copyWith({
    int? minuteInterval,
    int? secondInterval,
    double? itemExtent,
    Color? backgroundColor,
  }) {
    return NaTimePickerOptionsGeneric(
      minuteInterval : minuteInterval ?? this.minuteInterval,
      secondInterval : secondInterval ?? this.secondInterval,
      itemExtent     : itemExtent ?? this.itemExtent,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }
}

/// Material-specific options for [NaTimePicker].
class NaTimePickerOptionsMaterial extends NaTimePickerOptionsGeneric {
  /// The label for the hour input field.
  final String? hourLabelText;

  /// The label for the minute input field.
  final String? minuteLabelText;

  /// The label for the second input field.
  final String? secondLabelText;

  /// Whether to display the seconds wheel column.
  final bool showSeconds;

  /// The text of the cancel button (legacy dialog compatibility).
  final String? cancelText;

  /// The text of the confirm button (legacy dialog compatibility).
  final String? confirmText;

  /// The text displayed at the top of the dialog (legacy dialog compatibility).
  final String? helpText;

  /// The text displayed when an invalid value is entered (legacy dialog compatibility).
  final String? errorInvalidText;

  /// The initial entry mode for the time picker (legacy dialog compatibility).
  final TimePickerEntryMode? initialEntryMode;

  /// The orientation layout for the picker (legacy dialog compatibility).
  final Orientation? orientation;

  /// Creates a [NaTimePickerOptionsMaterial].
  NaTimePickerOptionsMaterial({
    this.hourLabelText,
    this.minuteLabelText,
    this.secondLabelText,
    this.showSeconds = true,
    this.cancelText,
    this.confirmText,
    this.helpText,
    this.errorInvalidText,
    this.initialEntryMode,
    this.orientation,
    super.minuteInterval,
    super.secondInterval,
    super.itemExtent,
    super.backgroundColor,
  });

  /// Creates an empty [NaTimePickerOptionsMaterial] with default values.
  NaTimePickerOptionsMaterial.empty() : this();

  /// Creates a [NaTimePickerOptionsMaterial] from generic options.
  NaTimePickerOptionsMaterial.fromGeneric(
    NaTimePickerOptionsGeneric? generic, {
    this.hourLabelText,
    this.minuteLabelText,
    this.secondLabelText,
    this.showSeconds = true,
    this.cancelText,
    this.confirmText,
    this.helpText,
    this.errorInvalidText,
    this.initialEntryMode,
    this.orientation,
  }) : super(
         minuteInterval : generic?.minuteInterval,
         secondInterval : generic?.secondInterval,
         itemExtent     : generic?.itemExtent,
         backgroundColor: generic?.backgroundColor,
       );

  /// Creates a copy of this [NaTimePickerOptionsMaterial] with the given fields replaced by non-null values.
  @override
  NaTimePickerOptionsMaterial copyWith({
    String? hourLabelText,
    String? minuteLabelText,
    String? secondLabelText,
    bool? showSeconds,
    String? cancelText,
    String? confirmText,
    String? helpText,
    String? errorInvalidText,
    TimePickerEntryMode? initialEntryMode,
    Orientation? orientation,
    int? minuteInterval,
    int? secondInterval,
    double? itemExtent,
    Color? backgroundColor,
  }) {
    return NaTimePickerOptionsMaterial(
      hourLabelText   : hourLabelText ?? this.hourLabelText,
      minuteLabelText : minuteLabelText ?? this.minuteLabelText,
      secondLabelText : secondLabelText ?? this.secondLabelText,
      showSeconds     : showSeconds ?? this.showSeconds,
      cancelText      : cancelText ?? this.cancelText,
      confirmText     : confirmText ?? this.confirmText,
      helpText        : helpText ?? this.helpText,
      errorInvalidText: errorInvalidText ?? this.errorInvalidText,
      initialEntryMode: initialEntryMode ?? this.initialEntryMode,
      orientation     : orientation ?? this.orientation,
      minuteInterval  : minuteInterval ?? this.minuteInterval,
      secondInterval  : secondInterval ?? this.secondInterval,
      itemExtent      : itemExtent ?? this.itemExtent,
      backgroundColor : backgroundColor ?? this.backgroundColor,
    );
  }
}

/// Cupertino-specific options for [NaTimePicker], resolving into a [CupertinoTimerPicker].
class NaTimePickerOptionsCupertino extends NaTimePickerOptionsGeneric {
  /// The timer picker display mode.
  final CupertinoTimerPickerMode? mode;

  /// How the child is aligned within the widget.
  final AlignmentGeometry? alignment;

  /// Creates a [NaTimePickerOptionsCupertino].
  NaTimePickerOptionsCupertino({
    this.mode,
    this.alignment,
    super.minuteInterval,
    super.secondInterval,
    super.itemExtent,
    super.backgroundColor,
  });

  /// Creates an empty [NaTimePickerOptionsCupertino] with default values.
  NaTimePickerOptionsCupertino.empty() : this();

  /// Creates a [NaTimePickerOptionsCupertino] from generic options.
  NaTimePickerOptionsCupertino.fromGeneric(
    NaTimePickerOptionsGeneric? generic, {
    this.mode,
    this.alignment,
  }) : super(
         minuteInterval : generic?.minuteInterval,
         secondInterval : generic?.secondInterval,
         itemExtent     : generic?.itemExtent,
         backgroundColor: generic?.backgroundColor,
       );

  /// Creates a copy of this [NaTimePickerOptionsCupertino] with the given fields replaced by non-null values.
  @override
  NaTimePickerOptionsCupertino copyWith({
    CupertinoTimerPickerMode? mode,
    AlignmentGeometry? alignment,
    int? minuteInterval,
    int? secondInterval,
    double? itemExtent,
    Color? backgroundColor,
  }) {
    return NaTimePickerOptionsCupertino(
      mode           : mode ?? this.mode,
      alignment      : alignment ?? this.alignment,
      minuteInterval : minuteInterval ?? this.minuteInterval,
      secondInterval : secondInterval ?? this.secondInterval,
      itemExtent     : itemExtent ?? this.itemExtent,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }
}

/// A generic TimePicker widget that automatically renders a platform-adaptive inline
/// duration/timer picker on Material and Cupertino.
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
    final NaTimePickerOptions? options = this.optionsBuilder?.call(context, uiType);

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

      return _NaMaterialTimerPicker(
        initialTimerDuration  : this.initialTimerDuration,
        onTimerDurationChanged: this.onTimerDurationChanged,
        options               : materialOptions,
      );
    }

    return null;
  }
}

/// Internal Material-styled inline timer picker providing identical behavior to [CupertinoTimerPicker].
class _NaMaterialTimerPicker extends StatefulWidget {
  final Duration initialTimerDuration;
  final ValueChanged<Duration> onTimerDurationChanged;
  final NaTimePickerOptionsMaterial? options;

  const _NaMaterialTimerPicker({
    required this.initialTimerDuration,
    required this.onTimerDurationChanged,
    this.options,
  });

  @override
  State<_NaMaterialTimerPicker> createState() => _NaMaterialTimerPickerState();
}

class _NaMaterialTimerPickerState extends State<_NaMaterialTimerPicker> {
  late FixedExtentScrollController _hourController;
  late FixedExtentScrollController _minuteController;
  late FixedExtentScrollController _secondController;

  late int _selectedHour;
  late int _selectedMinute;
  late int _selectedSecond;

  int get _minuteInterval => widget.options?.minuteInterval ?? 1;
  int get _secondInterval => widget.options?.secondInterval ?? 1;
  bool get _showSeconds => widget.options?.showSeconds ?? true;
  double get _itemExtent => widget.options?.itemExtent ?? 40.0;

  @override
  void initState() {
    super.initState();

    final int totalSeconds = widget.initialTimerDuration.inSeconds;
    _selectedHour          = (totalSeconds ~/ 3600).clamp(0, 23);
    _selectedMinute        = ((totalSeconds % 3600) ~/ 60).clamp(0, 59);
    _selectedSecond        = (totalSeconds % 60).clamp(0, 59);

    _hourController   = FixedExtentScrollController(initialItem: _selectedHour);
    _minuteController = FixedExtentScrollController(
      initialItem: _selectedMinute ~/ _minuteInterval,
    );
    _secondController = FixedExtentScrollController(
      initialItem: _selectedSecond ~/ _secondInterval,
    );
  }

  @override
  void dispose() {
    _hourController.dispose();
    _minuteController.dispose();
    _secondController.dispose();
    super.dispose();
  }

  void _notifyChanged() {
    final Duration newDuration = Duration(
      hours  : _selectedHour,
      minutes: _selectedMinute,
      seconds: _selectedSecond,
    );
    widget.onTimerDurationChanged(newDuration);
  }

  Widget _buildWheelColumn({
    required FixedExtentScrollController controller,
    required int itemCount,
    required int Function(int index) valueBuilder,
    required ValueChanged<int> onSelectedItemChanged,
    required String label,
    required ThemeData theme,
  }) {
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children : [
          // Scrollable wheel
          ListWheelScrollView.useDelegate(
            controller           : controller,
            itemExtent           : _itemExtent,
            physics              : const FixedExtentScrollPhysics(),
            perspective          : 0.003,
            diameterRatio        : 1.5,
            onSelectedItemChanged: (int index) {
              onSelectedItemChanged(valueBuilder(index));
              _notifyChanged();
            },
            childDelegate: ListWheelChildBuilderDelegate(
              childCount: itemCount,
              builder   : (BuildContext context, int index) {
                final int value   = valueBuilder(index);
                final String text = value.toString().padLeft(2, '0');
                return Center(
                  child: Text(
                    text,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              },
            ),
          ),
          // Column label
          Positioned(
            right: 12.0,
            child: Text(
              label,
              style: theme.textTheme.labelMedium?.copyWith(
                color     : theme.colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final int minuteCount = (60 / _minuteInterval).ceil();
    final int secondCount = (60 / _secondInterval).ceil();

    return Container(
      height   : 216.0,
      color    : widget.options?.backgroundColor,
      alignment: Alignment.center,
      child    : Stack(
        alignment: Alignment.center,
        children : [
          // Highlight bar behind active item
          Container(
            height    : _itemExtent,
            margin    : const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              color       : theme.colorScheme.primary.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          // Wheel columns
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children         : [
              // Hours wheel
              _buildWheelColumn(
                controller           : _hourController,
                itemCount            : 24,
                valueBuilder         : (int index) => index,
                onSelectedItemChanged: (int value) {
                  setState(() {
                    _selectedHour = value;
                  });
                },
                label: widget.options?.hourLabelText ?? 'h',
                theme: theme,
              ),
              // Separator
              Text(
                ':',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color     : theme.colorScheme.onSurfaceVariant,
                ),
              ),
              // Minutes wheel
              _buildWheelColumn(
                controller           : _minuteController,
                itemCount            : minuteCount,
                valueBuilder         : (int index) => index * _minuteInterval,
                onSelectedItemChanged: (int value) {
                  setState(() {
                    _selectedMinute = value;
                  });
                },
                label: widget.options?.minuteLabelText ?? 'm',
                theme: theme,
              ),
              // Optional Seconds wheel
              if (_showSeconds) ...[
                Text(
                  ':',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color     : theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                _buildWheelColumn(
                  controller           : _secondController,
                  itemCount            : secondCount,
                  valueBuilder         : (int index) => index * _secondInterval,
                  onSelectedItemChanged: (int value) {
                    setState(() {
                      _selectedSecond = value;
                    });
                  },
                  label: widget.options?.secondLabelText ?? 's',
                  theme: theme,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
