import 'package:flutter/material.dart';
import 'package:nanna_flutter_platform/nanna_flutter_platform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatefulWidget {
  const ExampleApp({super.key});

  @override
  State<ExampleApp> createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  bool _switchValue = false;
  bool _checkboxValue = false;
  double _sliderValue = 50.0;

  void _changePlatform(String? platform) {
    setState(() {
      NaPlatformInfoService.overridePlatform = platform;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget scaffold = NaPlatformScaffold(
      title: const Text('Demo Widget Multi-Piattaforma'),
      actions: [
        NaPlatformIconButton(
          icon: const Icon(Icons.info_outline),
          onPressed: () {
            // Un comodo metodo per mostrare l'alert
            NaPlatformAlertDialog.naShowAsync(
              context: context,
              title: const Text('Info'),
              content: const Text('Questi sono i widget multipiattaforma.'),
              actions: [
                NaPlatformButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Chiudi'),
                )
              ],
            );
          },
        )
      ],
      body: Material(
        type: MaterialType.transparency,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
        children: [
          // Selettore piattaforma
          Text('Cambia Renderizzazione', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () => _changePlatform('android'),
                  child: const Text('Material'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => _changePlatform('ios'),
                  child: const Text('Cupertino'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => _changePlatform('windows'),
                  child: const Text('Fluent UI'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => _changePlatform(null),
                  child: const Text('Auto (Nativo)'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          
          // Tutti i widget 
          NaPlatformCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('1. NaPlatformButton', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                NaPlatformButton(
                  onPressed: () {},
                  child: const Text('Bottone Primario'),
                ),
                const Divider(height: 32),
                
                const Text('2. NaPlatformTextField', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                const NaPlatformTextField(
                  placeholder: 'Scrivi qualcosa qui...',
                ),
                const Divider(height: 32),
                
                const Text('3. NaPlatformSwitch', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    NaPlatformSwitch(
                      value: this._switchValue,
                      onChanged: (val) => setState(() => this._switchValue = val),
                    ),
                    const SizedBox(width: 12),
                    Text('Stato: ${this._switchValue ? "Attivo" : "Spento"}'),
                  ],
                ),
                const Divider(height: 32),
                
                const Text('4. NaPlatformCheckbox', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    NaPlatformCheckbox(
                      value: this._checkboxValue,
                      onChanged: (val) => setState(() => this._checkboxValue = val ?? false),
                    ),
                    const SizedBox(width: 12),
                    Text('Spuntato: ${this._checkboxValue ? "Sì" : "No"}'),
                  ],
                ),
                const Divider(height: 32),
                
                const Text('5. NaPlatformSlider', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                NaPlatformSlider(
                  value: this._sliderValue,
                  min: 0,
                  max: 100,
                  onChanged: (val) => setState(() => this._sliderValue = val),
                ),
                const Divider(height: 32),
                
                const Text('6. NaPlatformProgressIndicator', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                const Center(child: NaPlatformProgressIndicator()),
              ],
            ),
          ),
        ],
      ),
      ),
    );

    // Lo stesso vale per Cupertino (sebbene MaterialApp in genere basti, CupertinoTheme è più pulito)
    if (NaPlatformInfoService.isIOS) {
      scaffold = CupertinoTheme(
        data: const CupertinoThemeData(brightness: Brightness.light),
        child: scaffold,
      );
    }

    return MaterialApp(
      title: 'Platform Widgets Demo',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('it', ''),
      ],
      home: scaffold,
    );
  }
}

