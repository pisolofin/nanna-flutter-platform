import 'package:flutter/widgets.dart';
import 'package:nanna_platform/nanna_platform.dart';

class ExampleSearchBarWidget extends StatelessWidget {
  const ExampleSearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'NaSearchBar',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          NaSearchBar(
            hintText: 'Search for something...',
            onChanged: (value) {
              debugPrint('Search changed: $value');
            },
            onSubmitted: (value) {
              debugPrint('Search submitted: $value');
            },
          ),
        ],
      ),
    );
  }
}
