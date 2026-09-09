import 'package:flutter/widgets.dart';
import 'package:nanna_platform/nanna_platform.dart';

class ExampleScrollbarWidget extends StatefulWidget {
  const ExampleScrollbarWidget({super.key});

  @override
  State<ExampleScrollbarWidget> createState() => _ExampleScrollbarWidgetState();
}

class _ExampleScrollbarWidgetState extends State<ExampleScrollbarWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'NaScrollbar',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          SizedBox(
            height: 120.0,
            child: NaScrollbar(
              controller: _scrollController,
              thumbVisibility: true,
              child: ListView.builder(
                controller: _scrollController,
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Scrollable Item $index'),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
