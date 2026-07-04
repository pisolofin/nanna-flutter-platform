import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nanna_flutter_platform/nanna_flutter_platform.dart';

import '../main.dart';

class ExampleHomePage extends StatelessWidget {
  const ExampleHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final NaUiType uiType = NaUiTypeScope.of(context);
    final bool isMaterial = uiType == NaUiType.material;

    return NaPlatformScaffold(
      appBar: NaPlatformAppBar(
        title: const Text('Nanna Platform Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Current UI Type: ${isMaterial ? 'Material' : 'Cupertino'}',
              style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30.0),
            NaPlatformButton(
              onPressed: AppStateScope.of(context).toggleUiType,
              child: Text(
                'Switch to ${isMaterial ? 'Cupertino' : 'Material'}',
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
