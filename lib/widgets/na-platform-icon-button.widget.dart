import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../services/na-platform-info.service.dart';

class NaPlatformIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget icon;

  const NaPlatformIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    if (NaPlatformInfoService.isWindows) {
      return fluent.IconButton(icon: this.icon, onPressed: this.onPressed,);
    } else if (NaPlatformInfoService.isIOS) {
      return CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: this.onPressed,
        child: this.icon,
      );
    }else {
      return IconButton(
        onPressed: this.onPressed,
        icon: this.icon,
      );
    }
  }
}




