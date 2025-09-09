import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter/material.dart';
import 'package:secure_image_viewer/secure_image_viewer.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('SecureImageViewer displays an image', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SecureImageViewer(
            imageProvider: NetworkImage("https://via.placeholder.com/400"),
          ),
        ),
      ),
    );

    // Check that Image widget is present
    expect(find.byType(Image), findsOneWidget);
  });
}
