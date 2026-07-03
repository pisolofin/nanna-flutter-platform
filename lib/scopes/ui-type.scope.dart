import 'package:flutter/widgets.dart';

import '../models/ui-type.model.dart';

class NaUiTypeScope extends InheritedWidget {
  final NaUiType uiType;

  const NaUiTypeScope({super.key, required this.uiType, required super.child});

  static NaUiType of(BuildContext context) {
    final NaUiTypeScope? scope = context
        .dependOnInheritedWidgetOfExactType<NaUiTypeScope>();
    return scope?.uiType ?? NaUiType.material;
  }

  @override
  bool updateShouldNotify(NaUiTypeScope oldWidget) {
    return uiType != oldWidget.uiType;
  }
}
