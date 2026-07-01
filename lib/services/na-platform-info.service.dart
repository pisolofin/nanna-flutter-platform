import 'dart:io';
import 'package:flutter/foundation.dart';

class NaPlatformInfoService {
  static String? overridePlatform;

  static bool get isIOS {
    if (overridePlatform != null) return overridePlatform == 'ios';
    if (kIsWeb) {
      return false;
    }
    return Platform.isIOS;
  }

  static bool get isAndroid {
    if (overridePlatform != null) return overridePlatform == 'android';
    if (kIsWeb) {
      return false;
    }
    return Platform.isAndroid;
  }

  static bool get isWindows {
    if (overridePlatform != null) return overridePlatform == 'windows';
    if (kIsWeb) {
      return false;
    }
    return Platform.isWindows;
  }

  static bool get isMacOS {
    if (overridePlatform != null) return overridePlatform == 'macos';
    if (kIsWeb) {
      return false;
    }
    return Platform.isMacOS;
  }

  static bool get isLinux {
    if (overridePlatform != null) return overridePlatform == 'linux';
    if (kIsWeb) {
      return false;
    }
    return Platform.isLinux;
  }

  static bool get isWeb {
    if (overridePlatform != null) return overridePlatform == 'web';
    return kIsWeb;
  }
}


