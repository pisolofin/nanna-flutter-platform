import 'package:flutter/widgets.dart';

import 'package:nanna_platform/nanna_platform.dart';

/// A showcase widget displaying a selection of cross-platform icons provided by [NaIcons].
class ExampleIconsWidget extends StatelessWidget {
  const ExampleIconsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_IconItem> iconItemList = const [
      _IconItem('home', NaIcons.home),
      _IconItem('settings', NaIcons.settings),
      _IconItem('search', NaIcons.search),
      _IconItem('person', NaIcons.person),
      _IconItem('email', NaIcons.email),
      _IconItem('add', NaIcons.add),
      _IconItem('delete', NaIcons.delete),
      _IconItem('edit', NaIcons.edit),
      _IconItem('check', NaIcons.check),
      _IconItem('close', NaIcons.close),
      _IconItem('info', NaIcons.info),
      _IconItem('expand', NaIcons.expand),
      _IconItem('shrink', NaIcons.shrink),
      _IconItem('chevronRight', NaIcons.chevronRight),
      _IconItem('chevronLeft', NaIcons.chevronLeft),
      _IconItem('star', NaIcons.star),
      _IconItem('favorite', NaIcons.favorite),
      _IconItem('share', NaIcons.share),
      _IconItem('lock', NaIcons.lock),
      _IconItem('notifications', NaIcons.notifications),
      _IconItem('camera', NaIcons.camera),
      _IconItem('map', NaIcons.map),
      _IconItem('cloud', NaIcons.cloud),
      _IconItem('lightMode', NaIcons.lightMode),
    ];

    return NaCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          const Text(
            'NaIcons Cross-Platform Showcase',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),

          // Section Subtitle
          const Text(
            'Icons automatically adapt between Material and Cupertino designs:',
            style: TextStyle(fontSize: 13.0),
          ),
          const SizedBox(height: 16.0),

          // Icons Grid
          Wrap(
            spacing: 16.0,
            runSpacing: 16.0,
            children: [
              for (final _IconItem item in iconItemList) ...[
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Icon preview
                    NaIcon(item.iconData, size: 28.0),
                    const SizedBox(height: 4.0),

                    // Icon label
                    Text(item.label, style: const TextStyle(fontSize: 11.0)),
                  ],
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

/// Helper model for rendering an icon item in the showcase grid.
class _IconItem {
  final String label;
  final NaIconData iconData;

  const _IconItem(this.label, this.iconData);
}
