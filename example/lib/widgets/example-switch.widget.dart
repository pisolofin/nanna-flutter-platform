import 'package:flutter/widgets.dart';
import 'package:nanna_platform/nanna_platform.dart';

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
        const Text('NaSwitch:'),
        NaSwitch(
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
