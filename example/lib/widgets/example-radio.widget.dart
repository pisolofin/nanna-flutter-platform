import 'package:flutter/material.dart';
import 'package:nanna_platform/nanna_platform.dart';

class ExampleRadioWidget extends StatefulWidget {
  const ExampleRadioWidget({super.key});

  @override
  State<ExampleRadioWidget> createState() => _ExampleRadioWidgetState();
}

class _ExampleRadioWidgetState extends State<ExampleRadioWidget> {
  int _radioValue = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('NaRadio:'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NaRadio<int>(
              value: 1,
              groupValue: _radioValue,
              onChanged: (int? value) {
                if (value != null) {
                  setState(() => _radioValue = value);
                }
              },
            ),
            const Text('Option 1'),
            const SizedBox(width: 20.0),
            NaRadio<int>(
              value: 2,
              groupValue: _radioValue,
              onChanged: (int? value) {
                if (value != null) {
                  setState(() => _radioValue = value);
                }
              },
            ),
            const Text('Option 2'),
          ],
        ),
      ],
    );
  }
}
