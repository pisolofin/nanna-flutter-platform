import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/ui-type.model.dart';
import '../models/icon-data.model.dart';

/// A collection of commonly used icons mapped for cross-platform usage.
class NaIcons {
  static const NaIconData home = NaIconData(
    Icons.home,
    platformIcons: { NaUiType.cupertino: CupertinoIcons.home },
  );

  static const NaIconData settings = NaIconData(
    Icons.settings,
    platformIcons: { NaUiType.cupertino: CupertinoIcons.settings },
  );

  static const NaIconData info = NaIconData(
    Icons.info_outline,
    platformIcons: { NaUiType.cupertino: CupertinoIcons.info },
  );

  static const NaIconData person = NaIconData(
    Icons.person,
    platformIcons: { NaUiType.cupertino: CupertinoIcons.person },
  );

  static const NaIconData email = NaIconData(
    Icons.email,
    platformIcons: { NaUiType.cupertino: CupertinoIcons.mail },
  );

  static const NaIconData add = NaIconData(
    Icons.add,
    platformIcons: { NaUiType.cupertino: CupertinoIcons.add },
  );

  static const NaIconData close = NaIconData(
    Icons.close,
    platformIcons: { NaUiType.cupertino: CupertinoIcons.clear },
  );

  static const NaIconData chevronRight = NaIconData(
    Icons.chevron_right,
    platformIcons: { NaUiType.cupertino: CupertinoIcons.chevron_right },
  );

  static const NaIconData chevronLeft = NaIconData(
    Icons.chevron_left,
    platformIcons: { NaUiType.cupertino: CupertinoIcons.chevron_left },
  );

  static const NaIconData search = NaIconData(
    Icons.search,
    platformIcons: { NaUiType.cupertino: CupertinoIcons.search },
  );

  static const NaIconData check = NaIconData(
    Icons.check,
    platformIcons: { NaUiType.cupertino: CupertinoIcons.checkmark_alt },
  );

  static const NaIconData delete = NaIconData(
    Icons.delete,
    platformIcons: { NaUiType.cupertino: CupertinoIcons.delete },
  );

  static const NaIconData edit = NaIconData(
    Icons.edit,
    platformIcons: { NaUiType.cupertino: CupertinoIcons.pencil },
  );
}
