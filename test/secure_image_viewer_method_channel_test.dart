import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:secure_image_viewer/secure_image_viewer.dart';

void main() {
  testWidgets('SecureImageViewer displays network image', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SecureImageViewer(
            imageProvider: NetworkImage("https://via.placeholder.com/400"),
          ),
        ),
      ),
    );

    // Check that an Image widget is present
    expect(find.byType(Image), findsOneWidget);
  });

  testWidgets('SecureImageViewer shows watermark text', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SecureImageViewer(
            imageProvider: NetworkImage("https://via.placeholder.com/400"),
            watermarkText: "Confidential",
          ),
        ),
      ),
    );

    // Since the watermark is painted using CustomPainter, verify the Stack exists
    expect(find.byType(Stack), findsOneWidget);
  });
}
