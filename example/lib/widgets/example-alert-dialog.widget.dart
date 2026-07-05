import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nanna_flutter_platform/nanna_flutter_platform.dart';

class ExampleAlertDialogWidget extends StatelessWidget {
  const ExampleAlertDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final NaUiType uiType = NaUiTypeScope.of(context);
    final bool isMaterial = uiType == NaUiType.material;

    return NaPlatformButton(
      onPressed: () {
        final dialog = NaPlatformAlertDialog(
          title: const Text('Confirm Action'),
          content: const Text('Are you sure you want to proceed?'),
          actions: [
            NaPlatformDialogAction(
              onPressed: () => Navigator.pop(context),
              optionsBuilder: (context, uiType) {
                if (uiType == NaUiType.cupertino) {
                  return NaPlatformDialogActionOptionsCupertino(isDestructiveAction: true);
                }
                return null;
              },
              child: const Text('Cancel'),
            ),
            NaPlatformDialogAction(
              onPressed: () => Navigator.pop(context),
              optionsBuilder: (context, uiType) {
                if (uiType == NaUiType.cupertino) {
                  return NaPlatformDialogActionOptionsCupertino(isDefaultAction: true);
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
