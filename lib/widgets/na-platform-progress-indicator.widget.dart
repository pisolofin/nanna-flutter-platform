import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../services/na-platform-info.service.dart';

class NaPlatformProgressIndicator extends StatelessWidget {
  const NaPlatformProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    if (NaPlatformInfoService.isWindows) {
      return const fluent.ProgressRing();
    } else if (NaPlatformInfoService.isIOS) {
      return const CupertinoActivityIndicator();
    }else {
      return const CircularProgressIndicator();
    }
  }
}




