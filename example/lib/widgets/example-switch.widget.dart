import 'package:flutter/material.dart';
import 'package:nanna_flutter_platform/nanna_flutter_platform.dart';

class ExampleSwitchWidget extends StatefulWidget {
  const ExampleSwitchWidget({super.key});

  @override
  State<ExampleSwitchWidget> createState() => _ExampleSwitchWidgetState();
}

class _ExampleSwitchWidgetState extends State<ExampleSwitchWidget> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('NaPlatformSwitch:'),
        NaPlatformSwitch(
          value: _switchValue,
          onChanged: (bool value) {
            setState(() {
              _switchValue = value;
            });
          },
        ),
      ],
    );
  }
}
