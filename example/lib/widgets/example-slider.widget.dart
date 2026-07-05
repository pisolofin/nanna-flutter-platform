import 'package:flutter/material.dart';
import 'package:nanna_flutter_platform/nanna_flutter_platform.dart';

class ExampleSliderWidget extends StatefulWidget {
  const ExampleSliderWidget({super.key});

  @override
  State<ExampleSliderWidget> createState() => _ExampleSliderWidgetState();
}

class _ExampleSliderWidgetState extends State<ExampleSliderWidget> {
  double _sliderValue = 0.5;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('NaPlatformSlider:'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: NaPlatformSlider(
            value: _sliderValue,
            onChanged: (double value) {
              setState(() {
                _sliderValue = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
