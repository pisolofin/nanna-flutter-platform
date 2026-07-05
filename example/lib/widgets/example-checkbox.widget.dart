import 'package:flutter/material.dart';
import 'package:nanna_flutter_platform/nanna_flutter_platform.dart';

class ExampleCheckboxWidget extends StatefulWidget {
  const ExampleCheckboxWidget({super.key});

  @override
  State<ExampleCheckboxWidget> createState() => _ExampleCheckboxWidgetState();
}

class _ExampleCheckboxWidgetState extends State<ExampleCheckboxWidget> {
  bool _checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('NaCheckbox:'),
        NaCheckbox(
          value: _checkboxValue,
          onChanged: (bool? value) {
            setState(() {
              _checkboxValue = value ?? false;
            });
          },
        ),
      ],
    );
  }
}
