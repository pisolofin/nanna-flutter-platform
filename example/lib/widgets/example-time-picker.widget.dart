import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nanna_flutter_platform/nanna_flutter_platform.dart';

class ExampleTimePickerWidget extends StatelessWidget {
  const ExampleTimePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final NaUiType uiType = NaUiTypeScope.of(context);
    final bool isMaterial = uiType == NaUiType.material;

    return NaButton(
      onPressed: () {
        final picker = NaTimePicker(
          initialTimerDuration: const Duration(hours: 10, minutes: 30),
          onTimerDurationChanged: (duration) {},
        );

        if (isMaterial) {
          showDialog(
            context: context,
            builder: (context) => Dialog(child: picker),
          );
        } else {
          showCupertinoModalPopup(
            context: context,
            builder: (context) => Container(
              height: 250,
              color: CupertinoColors.systemBackground.resolveFrom(context),
              child: SafeArea(top: false, child: picker),
            ),
          );
        }
      },
      child: const Text('Show Time Picker'),
    );
  }
}
