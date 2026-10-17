import 'package:flutter_test/flutter_test.dart';

import 'package:catalogo_motos/main.dart';

void main() {
  testWidgets('La app arranca y muestra el título', (tester) async {
    await tester.pumpWidget(const AplicacionMotos());
    expect(find.text('Catálogo de Motos'), findsWidgets);
  });
}
