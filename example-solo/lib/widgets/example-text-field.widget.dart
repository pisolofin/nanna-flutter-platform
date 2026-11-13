import 'package:flutter/widgets.dart';
import 'package:nanna_platform/nanna_platform.dart';
import 'package:flutter/cupertino.dart' show OverlayVisibilityMode;
import 'package:flutter/material.dart' show InputDecoration, OutlineInputBorder;

class ExampleTextFieldWidget extends StatefulWidget {
  const ExampleTextFieldWidget({ super.key });

  @override
  State<ExampleTextFieldWidget> createState() => _ExampleTextFieldWidgetState();
}

class _ExampleTextFieldWidgetState extends State<ExampleTextFieldWidget> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _captionController = TextEditingController();
  final TextEditingController _titleAboveController = TextEditingController();
  final TextEditingController _titleBorderController = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    _captionController.dispose();
    _titleAboveController.dispose();
    _titleBorderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Standard text field section header
        const Text('NaTextField:'),
        // Standard text field padded container
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40.0,
            vertical  : 10.0,
          ),
          child: NaTextField(
            controller    : _controller,
            optionsBuilder: (context, uiType) {
              if (uiType == NaUiType.cupertino) {
                return NaTextFieldOptionsCupertino(
                  placeholder    : 'Enter your name',
                  clearButtonMode: OverlayVisibilityMode.editing,
                );
              }
              return NaTextFieldOptionsMaterial(
                decoration: const InputDecoration(
                  hintText: 'Enter your name',
                  border  : OutlineInputBorder(),
                ),
              );
            },
          ),
        ),
        // Spacer before caption field
        const SizedBox(height: 10.0),
        // Caption text field section header
        const Text('NaTextFieldCaption:'),
        // Caption text field padded container
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40.0,
            vertical  : 10.0,
          ),
          child: NaTextFieldCaption(
            caption  : 'Email Address',
            gap      : 6.0,
            textField: NaTextField(
              controller    : _captionController,
              optionsBuilder: (context, uiType) {
                if (uiType == NaUiType.cupertino) {
                  return NaTextFieldOptionsCupertino(
                    placeholder    : 'Enter your email',
                    clearButtonMode: OverlayVisibilityMode.editing,
                  );
                }
                return NaTextFieldOptionsMaterial(
                  decoration: const InputDecoration(
                    hintText: 'Enter your email',
                    border  : OutlineInputBorder(),
                  ),
                );
              },
            ),
          ),
        ),
        // Spacer before title above field
        const SizedBox(height: 10.0),
        // Title above section header
        const Text('NaTextFieldTitle (above):'),
        // Title above padded container
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40.0,
            vertical  : 10.0,
          ),
          child: NaTextFieldTitle(
            title        : 'Username (above)',
            titlePosition: NaTextFieldTitlePosition.above,
            controller   : _titleAboveController,
            textField    : NaTextField(
              controller    : _titleAboveController,
              optionsBuilder: (context, uiType) {
                if (uiType == NaUiType.cupertino) {
                  return NaTextFieldOptionsCupertino(
                    placeholder: 'Enter username',
                  );
                }
                return NaTextFieldOptionsMaterial(
                  decoration: const InputDecoration(
                    hintText: 'Enter username',
                  ),
                );
              },
            ),
          ),
        ),
        // Spacer before title on border field
        const SizedBox(height: 10.0),
        // Title on border section header
        const Text('NaTextFieldTitle (onBorder):'),
        // Title on border padded container
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40.0,
            vertical  : 10.0,
          ),
          child: NaTextFieldTitle(
            title        : 'Password (onBorder)',
            titlePosition: NaTextFieldTitlePosition.onBorder,
            controller   : _titleBorderController,
            textField    : NaTextField(
              controller    : _titleBorderController,
              obscureText   : true,
              optionsBuilder: (context, uiType) {
                if (uiType == NaUiType.cupertino) {
                  return NaTextFieldOptionsCupertino(
                    placeholder: 'Enter password',
                  );
                }
                return NaTextFieldOptionsMaterial(
                  decoration: const InputDecoration(
                    hintText: 'Enter password',
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
