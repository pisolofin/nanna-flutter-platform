import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../services/na-platform-info.service.dart';

class NaPlatformSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const NaPlatformSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    if (NaPlatformInfoService.isWindows) {
      return fluent.ToggleSwitch(checked: this.value, onChanged: this.onChanged,);
    } else if (NaPlatformInfoService.isIOS) {
      return CupertinoSwitch(
        value: this.value,
        onChanged: this.onChanged,
      );
    }else {
      return Switch(
        value: this.value,
        onChanged: this.onChanged,
      );
    }
  }
}




