import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../services/na-platform-info.service.dart';

class NaPlatformCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const NaPlatformCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    if (NaPlatformInfoService.isIOS) {
      return CupertinoCheckbox(
        value: this.value,
        onChanged: this.onChanged,
      );
    }else {
      return Checkbox(
        value: this.value,
        onChanged: this.onChanged,
      );
    }
  }
}




