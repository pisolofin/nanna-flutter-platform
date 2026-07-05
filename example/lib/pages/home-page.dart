import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nanna_flutter_platform/nanna_flutter_platform.dart';

import '../main.dart';
import '../widgets/example-alert-dialog.widget.dart';
import '../widgets/example-bottom-navigation-bar.widget.dart';
import '../widgets/example-card-list.widget.dart';
import '../widgets/example-checkbox.widget.dart';
import '../widgets/example-date-picker.widget.dart';
import '../widgets/example-progress-indicator.widget.dart';
import '../widgets/example-radio.widget.dart';
import '../widgets/example-slider.widget.dart';
import '../widgets/example-switch.widget.dart';
import '../widgets/example-text-field.widget.dart';
import '../widgets/example-time-picker.widget.dart';

class ExampleHomePage extends StatelessWidget {
  const ExampleHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final NaUiType uiType = NaUiTypeScope.of(context);
    final bool isMaterial = uiType == NaUiType.material;

    return NaScaffold(
      appBar: NaAppBar(
        title: const Text('Nanna Platform Example'),
        actions: [
          NaIconButton(
            icon: Icon(isMaterial ? Icons.info_outline : CupertinoIcons.info),
            onPressed: () {},
          ),
        ],
      ),
      bottomNavigationBar: const ExampleBottomNavigationBarWidget(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Current UI Type: ${isMaterial ? 'Material' : 'Cupertino'}',
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30.0),
              NaButton(
                onPressed: AppStateScope.of(context).toggleUiType,
                child: Text(
                  'Switch to ${isMaterial ? 'Cupertino' : 'Material'}',
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
              const SizedBox(height: 40.0),

              const ExampleSwitchWidget(),
              const SizedBox(height: 20.0),

              const ExampleCheckboxWidget(),
              const SizedBox(height: 20.0),

              const ExampleRadioWidget(),
              const SizedBox(height: 20.0),

              const ExampleTextFieldWidget(),
              const SizedBox(height: 20.0),

              const ExampleSliderWidget(),
              const SizedBox(height: 20.0),

              const ExampleProgressIndicatorWidget(),
              const SizedBox(height: 40.0),

              const ExampleCardListWidget(),
              const SizedBox(height: 40.0),

              const ExampleAlertDialogWidget(),
              const SizedBox(height: 20.0),

              const ExampleDatePickerWidget(),
              const SizedBox(height: 20.0),

              const ExampleTimePickerWidget(),
              const SizedBox(height: 40.0),
            ],
          ),
        ),
      ),
    );
  }
}
