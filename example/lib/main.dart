import 'package:flutter/material.dart';
import 'package:secure_image_viewer/secure_image_viewer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: SecureDemo());
  }
}

class SecureDemo extends StatelessWidget {
  const SecureDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Secure Image Viewer")),
      body: Center(
        child: SecureImageViewer(
          imageProvider: NetworkImage("https://via.placeholder.com/400"),
          preventScreenshot: true,
          watermarkText: "Confidential",
          expireAfter: Duration(seconds: 10),
          onExpire: () => debugPrint("Image expired"),
        ),
      ),
    );
  }
}
