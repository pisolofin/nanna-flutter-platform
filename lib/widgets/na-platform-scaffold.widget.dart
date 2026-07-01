import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../services/na-platform-info.service.dart';

class NaPlatformScaffold extends StatelessWidget {
  final Widget body;
  final Widget? title;
  final List<Widget>? actions;
  final Color? backgroundColor;

  const NaPlatformScaffold({
    super.key,
    required this.body,
    this.title,
    this.actions,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    if (NaPlatformInfoService.isWindows) {
      return fluent.ScaffoldPage(
        header: this.title != null
            ? fluent.PageHeader(
                title: this.title,
                commandBar: this.actions != null
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: this.actions!,
                      )
                    : null,
              )
            : null,
        content: this.body,
      );
    } else if (NaPlatformInfoService.isIOS) {
      return CupertinoPageScaffold(
        navigationBar: this.title != null
            ? CupertinoNavigationBar(
                middle: this.title,
                trailing: this.actions != null
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: this.actions!,
                      )
                    : null,
              )
            : null,
        backgroundColor: this.backgroundColor,
        child: SafeArea(child: this.body),
      );
    }else {
      return Scaffold(
        appBar: this.title != null
            ? AppBar(
                title: this.title,
                actions: this.actions,
              )
            : null,
        backgroundColor: this.backgroundColor,
        body: this.body,
      );
    }
  }
}




