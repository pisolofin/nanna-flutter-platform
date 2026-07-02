import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../services/na-platform-info.service.dart';

class NaPlatformSlider extends StatelessWidget {
  final double value;
  final double min;
  final double max;
  final ValueChanged<double> onChanged;

  const NaPlatformSlider({
    super.key,
    required this.value,
    this.min = 0.0,
    this.max = 1.0,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    if (NaPlatformInfoService.isIOS) {
      return CupertinoSlider(
        value: this.value,
        min: this.min,
        max: this.max,
        onChanged: this.onChanged,
      );
    }else {
      return Slider(
        value: this.value,
        min: this.min,
        max: this.max,
        onChanged: this.onChanged,
      );
    }
  }
}




