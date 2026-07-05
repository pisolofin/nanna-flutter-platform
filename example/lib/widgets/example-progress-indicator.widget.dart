import 'package:flutter/material.dart';
import 'package:nanna_flutter_platform/nanna_flutter_platform.dart';

class ExampleProgressIndicatorWidget extends StatelessWidget {
  const ExampleProgressIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('NaProgressIndicator:'),
        SizedBox(height: 10.0),
        NaProgressIndicator(),
      ],
    );
  }
}
