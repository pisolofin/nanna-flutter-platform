import 'dart:io';

void main() {
  final dir = Directory('lib/src/widgets-flutter');
  final files = dir.listSync().whereType<File>().where((f) => f.path.endsWith('.dart'));

  for (final file in files) {
    List<String> lines = file.readAsLinesSync();
    bool insideMaterialBlock = false;
    
    for (int i = 0; i < lines.length; i++) {
      if (lines[i].trim() == 'if (uiType == NaUiType.material) {') {
        insideMaterialBlock = true;
        
        // Se la riga successiva è vuota, rimuoviamola o ignoriamola.
        // In questo script semplicemente la lasciamo ma non indentiamo se vuota.
        continue;
      }
      
      if (insideMaterialBlock) {
        if (lines[i] == '    }') {
          insideMaterialBlock = false;
          continue;
        }
        
        if (lines[i].isNotEmpty && !lines[i].startsWith('      ')) {
           // Aggiungiamo due spazi (indentazione)
           lines[i] = '  ' + lines[i];
        }
      }
    }
    
    file.writeAsStringSync(lines.join('\n') + '\n');
  }
  print('Indentation fixed!');
}
