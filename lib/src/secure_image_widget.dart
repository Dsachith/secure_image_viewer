import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'crypto_utils.dart';
import 'watermark_painter.dart';

class SecureImageViewer extends StatefulWidget {
  final ImageProvider? imageProvider;
  final Uint8List? encryptedBytes;
  final String? decryptionKey;
  final String? iv;
  final BoxFit fit;
  final bool preventScreenshot;
  final Duration? expireAfter;
  final VoidCallback? onExpire;
  final VoidCallback? onCaptureDetected;
  final String? watermarkText;

  const SecureImageViewer({
    super.key,
    this.imageProvider,
    this.encryptedBytes,
    this.decryptionKey,
    this.iv,
    this.fit = BoxFit.contain,
    this.preventScreenshot = true,
    this.expireAfter,
    this.onExpire,
    this.onCaptureDetected,
    this.watermarkText,
  });

  @override
  State<SecureImageViewer> createState() => _SecureImageViewerState();
}

class _SecureImageViewerState extends State<SecureImageViewer> {
  static const _channel = MethodChannel("secure_image_viewer");
  Uint8List? decryptedBytes;
  bool expired = false;

  @override
  void initState() {
    super.initState();

    if (widget.preventScreenshot) {
      _channel.invokeMethod("enableSecureMode");
    }

    if (widget.expireAfter != null) {
      Future.delayed(widget.expireAfter!, () {
        setState(() => expired = true);
        widget.onExpire?.call();
      });
    }

    if (widget.encryptedBytes != null && widget.decryptionKey != null && widget.iv != null) {
      decryptedBytes = decryptAES(widget.encryptedBytes!, widget.decryptionKey!, widget.iv!);
    }
  }

  @override
  void dispose() {
    if (widget.preventScreenshot) {
      _channel.invokeMethod("disableSecureMode");
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (expired) {
      return const Center(child: Text("⏳ Expired", style: TextStyle(color: Colors.red)));
    }

    Widget imageWidget;
    if (decryptedBytes != null) {
      imageWidget = Image.memory(decryptedBytes!, fit: widget.fit);
    } else if (widget.imageProvider != null) {
      imageWidget = Image(image: widget.imageProvider!, fit: widget.fit);
    } else {
      imageWidget = const Placeholder();
    }

    if (widget.watermarkText != null) {
      imageWidget = Stack(
        fit: StackFit.expand,
        children: [
          imageWidget,
          CustomPaint(
            painter: WatermarkPainter(widget.watermarkText!),
          ),
        ],
      );
    }

    return imageWidget;
  }
}
