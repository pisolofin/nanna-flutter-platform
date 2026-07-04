import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nanna_flutter_platform/nanna_flutter_platform.dart';

import '../main.dart';

class ExampleHomePage extends StatefulWidget {
  const ExampleHomePage({super.key});

  @override
  State<ExampleHomePage> createState() => _ExampleHomePageState();
}

class _ExampleHomePageState extends State<ExampleHomePage> {
  bool _switchValue = false;
  bool _checkboxValue = false;
  double _sliderValue = 0.5;

  @override
  Widget build(BuildContext context) {
    final NaUiType uiType = NaUiTypeScope.of(context);
    final bool isMaterial = uiType == NaUiType.material;

    return NaPlatformScaffold(
      appBar: NaPlatformAppBar(
        title: const Text('Nanna Platform Example'),
        actions: [
          NaPlatformIconButton(
            icon: Icon(isMaterial ? Icons.info_outline : CupertinoIcons.info),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Current UI Type: ${isMaterial ? 'Material' : 'Cupertino'}',
                style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30.0),
              NaPlatformButton(
                onPressed: AppStateScope.of(context).toggleUiType,
                child: Text(
                  'Switch to ${isMaterial ? 'Cupertino' : 'Material'}',
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
              const SizedBox(height: 40.0),
              const Text('NaPlatformSwitch:'),
              NaPlatformSwitch(
                value: _switchValue,
                onChanged: (bool value) {
                  setState(() {
                    _switchValue = value;
                  });
                },
              ),
              const SizedBox(height: 20.0),
              const Text('NaPlatformCheckbox:'),
              NaPlatformCheckbox(
                value: _checkboxValue,
                onChanged: (bool? value) {
                  setState(() {
                    _checkboxValue = value ?? false;
                  });
                },
              ),
              const SizedBox(height: 20.0),
              const Text('NaPlatformSlider:'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: NaPlatformSlider(
                  value: _sliderValue,
                  onChanged: (double value) {
                    setState(() {
                      _sliderValue = value;
                    });
                  },
                ),
              ),
              const SizedBox(height: 20.0),
              const Text('NaPlatformProgressIndicator:'),
              const SizedBox(height: 10.0),
              const NaPlatformProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
