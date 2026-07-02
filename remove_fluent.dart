import 'dart:io';

void main() {
  final dir = Directory('lib/widgets');
  for (final file in dir.listSync().whereType<File>()) {
    if (!file.path.endsWith('.dart')) continue;
    String content = file.readAsStringSync();
    
    content = content.replaceAll("import 'package:fluent_ui/fluent_ui.dart' as fluent;\r\n", '');
    content = content.replaceAll("import 'package:fluent_ui/fluent_ui.dart' as fluent;\n", '');
    
    final regExp = RegExp(r'if\s*\(NaPlatformInfoService\.isWindows\)\s*\{[\s\S]*?\}\s*else\s*if\s*\(NaPlatformInfoService\.isIOS\)');
    content = content.replaceAll(regExp, 'if (NaPlatformInfoService.isIOS)');
    
    // Also fix the case where isIOS is not used, e.g. if it just says if (NaPlatformInfoService.isWindows) { ... } else { ... }
    final regExp2 = RegExp(r'if\s*\(NaPlatformInfoService\.isWindows\)\s*\{[\s\S]*?\}\s*else\s*\{');
    content = content.replaceAll(regExp2, '{\n');
    
    file.writeAsStringSync(content);
  }
}
