import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:ai_homework/core/theme/theme_provider.dart';

void main() {
  testWidgets('Basic test', (WidgetTester tester) async {
    // Test a simple widget
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => ThemeProvider(),
        child: const MaterialApp(
          home: Scaffold(
            body: Center(
              child: Text('Test'),
            ),
          ),
        ),
      ),
    );

    // Verify the text is displayed
    expect(find.text('Test'), findsOneWidget);
  });
}
