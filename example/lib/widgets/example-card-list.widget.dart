import 'package:flutter/material.dart';
import 'package:nanna_flutter_platform/nanna_flutter_platform.dart';

class ExampleCardListWidget extends StatelessWidget {
  const ExampleCardListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('NaCard e NaListTile:'),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: NaCard(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                NaListTile(
                  leading: const NaIcon(NaIcons.person),
                  title: const Text('John Doe'),
                  subtitle: const Text('Software Engineer'),
                  hasChevron: true,
                  onTap: () {},
                ),
                NaListTile(
                  leading: const NaIcon(NaIcons.email),
                  title: const Text('john.doe@example.com'),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
