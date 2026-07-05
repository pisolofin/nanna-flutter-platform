import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nanna_flutter_platform/nanna_flutter_platform.dart';

class ExampleAlertDialogWidget extends StatelessWidget {
  const ExampleAlertDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final NaUiType uiType = NaUiTypeScope.of(context);
    final bool isMaterial = uiType == NaUiType.material;

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
                  return NaDialogActionOptionsCupertino(isDestructiveAction: true);
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

        if (isMaterial) {
          showDialog(context: context, builder: (context) => dialog);
        } else {
          showCupertinoDialog(context: context, builder: (context) => dialog);
        }
      },
      child: const Text('Show Alert Dialog'),
    );
  }
}
