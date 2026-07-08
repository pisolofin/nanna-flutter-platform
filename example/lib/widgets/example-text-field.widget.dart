import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nanna_platform/nanna_platform.dart';

class ExampleTextFieldWidget extends StatefulWidget {
  const ExampleTextFieldWidget({super.key});

  @override
  State<ExampleTextFieldWidget> createState() => _ExampleTextFieldWidgetState();
}

class _ExampleTextFieldWidgetState extends State<ExampleTextFieldWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('NaTextField:'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
          child: NaTextField(
            controller: _controller,
            optionsBuilder: (context, uiType) {
              if (uiType == NaUiType.cupertino) {
                return NaTextFieldOptionsCupertino(
                  placeholder: 'Enter your name',
                  clearButtonMode: OverlayVisibilityMode.editing,
                );
              }
              return NaTextFieldOptionsMaterial(
                decoration: const InputDecoration(
                  hintText: 'Enter your name',
                  border: OutlineInputBorder(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
