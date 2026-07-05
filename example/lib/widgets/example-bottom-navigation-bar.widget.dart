import 'package:flutter/material.dart';
import 'package:nanna_flutter_platform/nanna_flutter_platform.dart';

class ExampleBottomNavigationBarWidget extends StatefulWidget {
  const ExampleBottomNavigationBarWidget({super.key});

  @override
  State<ExampleBottomNavigationBarWidget> createState() =>
      _ExampleBottomNavigationBarWidgetState();
}

class _ExampleBottomNavigationBarWidgetState
    extends State<ExampleBottomNavigationBarWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NaBottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: const [
        BottomNavigationBarItem(icon: NaIcon(NaIcons.home), label: 'Home'),
        BottomNavigationBarItem(
          icon: NaIcon(NaIcons.settings),
          label: 'Settings',
        ),
      ],
    );
  }
}
