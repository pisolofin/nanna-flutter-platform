import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../services/na-platform-info.service.dart';

class NaPlatformCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const NaPlatformCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    if (NaPlatformInfoService.isIOS) {
      return Container(
        margin: this.margin ?? const EdgeInsets.all(4.0),
        padding: this.padding ?? const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: CupertinoTheme.of(context).barBackgroundColor,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: CupertinoColors.black.withOpacity(0.05),
              blurRadius: 10.0,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: this.child,
      );
    }else {
      return Card(
        margin: this.margin,
        child: this.padding != null
            ? Padding(padding: this.padding!, child: this.child)
            : this.child,
      );
    }
  }
}


