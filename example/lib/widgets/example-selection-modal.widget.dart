import 'package:flutter/widgets.dart';
import 'package:nanna_platform/nanna_platform.dart';

class ExampleSelectionModalWidget extends StatefulWidget {
  const ExampleSelectionModalWidget({ super.key });

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
        // Show bottom menu (Action Sheet)
        NaButton(
          onPressed: () async {
            final String? selected = await naShowActionSheetAsync<String>(
              context     : context,
              title       : const Text('Share My Location'),
              cancelButton: const Text('Cancel'),
              itemList    : const [
                NaSelectionItem(
                  value: 'Share for One Hour',
                  title: Text('Share for One Hour'),
                ),
                NaSelectionItem(
                  value: 'Share Until End of Day',
                  title: Text('Share Until End of Day'),
                ),
                NaSelectionItem(
                  value: 'Share Indefinitely',
                  title: Text('Share Indefinitely'),
                ),
              ],
            );

            if (selected != null) {
              setState(() {
                _selectedOption = selected;
              });
            }
          },
          child: const Text('Show Bottom Menu (Action Sheet)'),
        ),
        // Spacing
        const SizedBox(height: 12.0),
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
          child: const Text('Show Selection Modal / Sheet'),
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
