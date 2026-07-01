import 'dart:io';

void main() {
  final mappings = {
    'na-platform-button.widget.dart': 'return fluent.Button(onPressed: this.onPressed, child: this.child,);',
    'na-platform-card.widget.dart': 'return fluent.Card(padding: this.padding ?? const EdgeInsets.all(12.0), margin: this.margin ?? const EdgeInsets.all(4.0), child: this.child,);',
    'na-platform-checkbox.widget.dart': 'return fluent.Checkbox(checked: this.value, onChanged: this.onChanged,);',
    'na-platform-icon-button.widget.dart': 'return fluent.IconButton(icon: this.icon, onPressed: this.onPressed,);',
    'na-platform-progress-indicator.widget.dart': 'return const fluent.ProgressRing();',
    'na-platform-slider.widget.dart': 'return fluent.Slider(value: this.value, min: this.min, max: this.max, onChanged: this.onChanged,);',
    'na-platform-switch.widget.dart': 'return fluent.ToggleSwitch(checked: this.value, onChanged: this.onChanged,);',
    'na-platform-text-field.widget.dart': 'return fluent.TextBox(controller: this.controller, placeholder: this.placeholder, obscureText: this.obscureText, keyboardType: this.keyboardType, onChanged: this.onChanged,);',
    'na-platform-scaffold.widget.dart': '''return fluent.ScaffoldPage(
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
      );''',
    'na-platform-alert-dialog.widget.dart': '''return fluent.ContentDialog(
        title: this.title,
        content: this.content,
        actions: this.actions,
      );'''
  };

  final dir = Directory('lib/widgets');
  for (final file in dir.listSync().whereType<File>()) {
    if (!file.path.endsWith('.dart')) continue;
    String content = file.readAsStringSync();
    
    final filename = file.uri.pathSegments.last;
    if (mappings.containsKey(filename)) {
      final fluentReturn = mappings[filename]!;
      content = content.replaceFirst(r'$fluentReturn', fluentReturn);
      file.writeAsStringSync(content);
    }
  }
}
