import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:secure_image_viewer/secure_image_viewer.dart';
import 'dart:typed_data';

void main() {
  testWidgets('SecureImageViewer shows network image', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SecureImageViewer(
            imageProvider: NetworkImage("https://via.placeholder.com/400"),
          ),
        ),
      ),
    );

    expect(find.byType(Image), findsOneWidget);
  });

  testWidgets('SecureImageViewer shows watermark', (WidgetTester tester) async {
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

    expect(find.byType(Stack), findsOneWidget); // Stack wraps the image + watermark
  });

  testWidgets('SecureImageViewer expiry works', (WidgetTester tester) async {
    bool expiredCalled = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SecureImageViewer(
            imageProvider: NetworkImage("https://via.placeholder.com/400"),
            expireAfter: const Duration(milliseconds: 100),
            onExpire: () {
              expiredCalled = true;
            },
          ),
        ),
      ),
    );

    await tester.pump(const Duration(milliseconds: 150)); // wait for expiry
    expect(expiredCalled, true);
  });

  testWidgets('SecureImageViewer shows decrypted image from bytes', (WidgetTester tester) async {
    // Simple dummy byte array (not real encryption)
    final bytes = Uint8List.fromList([0, 1, 2, 3, 4, 5, 6, 7]);
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SecureImageViewer(
            encryptedBytes: bytes,
            decryptionKey: "1234567890123456",
            iv: "1234567890123456",
          ),
        ),
      ),
    );

    expect(find.byType(Image), findsOneWidget);
  });
}
