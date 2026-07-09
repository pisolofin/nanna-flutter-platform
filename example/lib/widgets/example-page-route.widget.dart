import 'package:flutter/widgets.dart';
import 'package:nanna_platform/nanna_platform.dart';

class ExamplePageRouteWidget extends StatelessWidget {
  const ExamplePageRouteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return NaButton(
      onPressed: () {
        Navigator.push(
          context,
          NaPageRoute.create(
            context,
            builder: (context) => const _TestPage(),
          ),
        );
      },
      child: const Text('Open PageRoute Example'),
    );
  }
}

class _TestPage extends StatelessWidget {
  const _TestPage();

  @override
  Widget build(BuildContext context) {
    return NaScaffold(
      appBar: NaAppBar(
        title: const Text('New Page'),
      ),
      body: const Center(
        child: Text('This page was pushed with NaPageRoute!'),
      ),
    );
  }
}
