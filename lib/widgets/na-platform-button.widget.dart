import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../services/na-platform-info.service.dart';

// Esempio di utilizzo di nanna_flutter:
// import 'package:nanna_flutter/nanna_flutter.dart';

class NaPlatformButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const NaPlatformButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (NaPlatformInfoService.isIOS) {
      return CupertinoButton(
        onPressed: this.onPressed,
        child: this.child,
      );
    }else {
      return ElevatedButton(
        onPressed: this.onPressed,
        child: this.child,
      );
    }
  }
}




