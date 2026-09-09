import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nanna_platform/nanna_platform.dart';

class ExampleAlertDialogWidget extends StatelessWidget {
  const ExampleAlertDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return NaButton(
      onPressed: () {
        final dialog = NaAlertDialog(
          title: const Text('Confirm Action'),
          content: const Text('Are you sure you want to proceed?'),
          actions: [
            NaDialogAction(
              onPressed: () => Navigator.pop(context),
              optionsBuilder: (context, uiType) {
                if (uiType == NaUiType.cupertino) {
                  return NaDialogActionOptionsCupertino(
                    isDestructiveAction: true,
                  );
                }
                return null;
              },
              child: const Text('Cancel'),
            ),
            NaDialogAction(
              onPressed: () => Navigator.pop(context),
              optionsBuilder: (context, uiType) {
                if (uiType == NaUiType.cupertino) {
                  return NaDialogActionOptionsCupertino(isDefaultAction: true);
                }
                return null;
              },
              child: const Text('OK'),
            ),
          ],
        );

        naShowDialog(context: context, builder: (context) => dialog);
      },
      child: const Text('Show Alert Dialog'),
    );
  }
}
