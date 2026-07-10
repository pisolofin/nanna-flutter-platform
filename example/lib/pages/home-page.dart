import 'package:flutter/widgets.dart';
import 'package:nanna_platform/nanna_platform.dart';

import '../main.dart';
import '../widgets/example-radio.widget.dart';
import '../widgets/example-slider.widget.dart';
import '../widgets/example-switch.widget.dart';
import '../widgets/example-checkbox.widget.dart';
import '../widgets/example-card-list.widget.dart';
import '../widgets/example-text-field.widget.dart';
import '../widgets/example-page-route.widget.dart';
import '../widgets/example-date-picker.widget.dart';
import '../widgets/example-time-picker.widget.dart';
import '../widgets/example-alert-dialog.widget.dart';
import '../widgets/example-progress-indicator.widget.dart';
import '../widgets/example-search-bar.widget.dart';
import '../widgets/example-scrollbar.widget.dart';
import '../widgets/example-bottom-navigation-bar.widget.dart';

class ExampleHomePage extends StatelessWidget {
  const ExampleHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final NaUiType uiType = NaUiTypeScope.of(context).first;
    final bool isMaterial = uiType == NaUiType.material;

    return NaScaffold(
      appBar: NaAppBar(
        title: const Text('Nanna Platform Example'),
        actions: [
          NaIconButton(icon: const NaIcon(NaIcons.info), onPressed: () {}),
        ],
      ),
      bottomNavigationBar: const ExampleBottomNavigationBarWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20.0),
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

                const ExamplePageRouteWidget(),
                const SizedBox(height: 20.0),

                const ExampleSwitchWidget(),
                const SizedBox(height: 20.0),

                const ExampleCheckboxWidget(),
                const SizedBox(height: 20.0),

                const ExampleRadioWidget(),
                const SizedBox(height: 20.0),

                const ExampleSearchBarWidget(),
                const SizedBox(height: 20.0),

                const ExampleScrollbarWidget(),
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
      ),
    );
  }
}
