import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../services/na-platform-info.service.dart';

class NaPlatformAlertDialog extends StatelessWidget {
  final Widget? title;
  final Widget? content;
  final List<Widget> actions;

  const NaPlatformAlertDialog({
    super.key,
    this.title,
    this.content,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    if (NaPlatformInfoService.isIOS) {
      return CupertinoAlertDialog(
        title: this.title,
        content: this.content,
        actions: this.actions,
      );
    } else {
      return AlertDialog(
        title: this.title,
        content: this.content,
        actions: this.actions,
      );
    }
  }

  /// Utility per mostrare il dialog in modo unificato a prescindere dalla piattaforma
  static Future<T?> naShowAsync<T>({
    required BuildContext context,
    Widget? title,
    Widget? content,
    required List<Widget> actions,
  }) {
    if (NaPlatformInfoService.isIOS) {
      return showCupertinoDialog<T>(
        context: context,
        builder: (context) => NaPlatformAlertDialog(
          title: title,
          content: content,
          actions: actions,
        ),
      );
    } else {
      return showDialog<T>(
        context: context,
        builder: (context) => NaPlatformAlertDialog(
          title: title,
          content: content,
          actions: actions,
        ),
      );
    }
  }
}
