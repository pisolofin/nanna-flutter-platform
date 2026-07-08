import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nanna_platform/nanna_platform.dart';
import '../helpers/test-helpers.dart';

class NaDummyWidget extends NaWidget {
  const NaDummyWidget({super.key});

  @override
  Widget? renderForUIType(BuildContext context, NaUiType uiType) {
    if (uiType == NaUiType.material) {
      return const Text('Material');
    }
    return null;
  }
}

void main() {
  testWidgets('NaWidget renders material if supported', (WidgetTester tester) async {
    await pumpMaterialNaWidget(tester, const NaDummyWidget());
    expect(find.text('Material'), findsOneWidget);
  });

  testWidgets('NaWidget falls back to material if cupertino not supported', (WidgetTester tester) async {
    await tester.pumpWidget(
      const NaUiTypeScope(
        uiTypes: [NaUiType.cupertino, NaUiType.material],
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: NaDummyWidget(),
        ),
      ),
    );
    // It should render Material because renderForUIType returns null for cupertino
    expect(find.text('Material'), findsOneWidget);
  });
}


