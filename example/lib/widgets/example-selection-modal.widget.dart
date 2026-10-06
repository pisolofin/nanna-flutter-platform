import 'package:flutter/widgets.dart';
import 'package:nanna_platform/nanna_platform.dart';

class ExampleSelectionModalWidget extends StatefulWidget {
  const ExampleSelectionModalWidget({super.key});

  @override
  State<ExampleSelectionModalWidget> createState() => _ExampleSelectionModalWidgetState();
}

class _ExampleSelectionModalWidgetState extends State<ExampleSelectionModalWidget> {
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children    : [
        // Show selection modal button
        NaButton(
          onPressed: () async {
            final String? selected = await naShowSelectionModalAsync<String>(
              context     : context,
              title       : const Text('Choose an Option'),
              message     : const Text('Select one of the available items from the list below:'),
              cancelButton: const Text('Cancel'),
              itemList    : [
                NaSelectionItem(
                  value     : 'apple',
                  title     : const Text('Apple'),
                  subtitle  : const Text('Fresh red fruit'),
                  isSelected: (_selectedOption == 'apple'),
                ),
                NaSelectionItem(
                  value     : 'banana',
                  title     : const Text('Banana'),
                  subtitle  : const Text('Sweet tropical fruit'),
                  isSelected: (_selectedOption == 'banana'),
                ),
                NaSelectionItem(
                  value     : 'orange',
                  title     : const Text('Orange'),
                  subtitle  : const Text('Juicy citrus fruit'),
                  isSelected: (_selectedOption == 'orange'),
                ),
                const NaSelectionItem(
                  value        : 'delete',
                  title        : Text('Remove selection'),
                  isDestructive: true,
                ),
              ],
            );

            if (selected != null) {
              setState(() {
                _selectedOption = (selected == 'delete') ? null : selected;
              });
            }
          },
          child    : const Text('Show Selection Modal / Sheet'),
        ),
        // Selected option display
        if (_selectedOption != null) ...[
          const SizedBox(height: 8.0),
          Text('Selected: $_selectedOption'),
        ],
      ],
    );
  }
}
