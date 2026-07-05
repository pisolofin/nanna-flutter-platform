import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nanna_flutter_platform/nanna_flutter_platform.dart';

class ExampleDatePickerWidget extends StatelessWidget {
  const ExampleDatePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final NaUiType uiType = NaUiTypeScope.of(context);
    final bool isMaterial = uiType == NaUiType.material;

    return NaPlatformButton(
      onPressed: () {
        final picker = NaPlatformDatePicker(
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
          onDateChanged: (date) {},
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
              child: SafeArea(
                top: false,
                child: picker,
              ),
            ),
          );
        }
      },
      child: const Text('Show Date Picker'),
    );
  }
}
