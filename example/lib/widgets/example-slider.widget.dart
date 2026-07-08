import 'package:flutter/widgets.dart';
import 'package:nanna_platform/nanna_platform.dart';

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
        const Text('NaSlider:'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: NaSlider(
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
