# SecureImageViewer

[![pub package](https://img.shields.io/pub/v/secure_image_viewer.svg)](https://pub.dev/packages/secure_image_viewer)  
[![Flutter](https://img.shields.io/badge/Flutter-3.x-blue.svg)](https://flutter.dev)

**SecureImageViewer** is a Flutter plugin that lets you display images securely in your app. It prevents screenshots, supports encrypted images, dynamic watermarks, auto-expiry, and works on **Android, iOS, Web, and Desktop** platforms. Perfect for banking apps, e-learning platforms, or any confidential content.

---

## 🔐 Features

- **Screenshot & Screen Recording Protection**
  - Android: Uses `FLAG_SECURE` to block screenshots and recording.  
  - iOS: Detects screen recording and optionally blurs the image.  

- **Encrypted Image Support**
  - Load images as encrypted bytes and decrypt **in memory** (AES-256).  

- **Dynamic Watermarks**
  - Add diagonal or custom watermarks to discourage content leaks.  

- **Auto-Expire Images**
  - Set a timer to automatically hide or remove the image after a duration.  

- **Blur or Placeholder on Capture**
  - Automatically blur or show a secure placeholder if capture is detected.  

- **Cross-Platform**
  - Works on **Android**, **iOS**, **Web**, **Windows**, **Mac**, and **Linux**.

---

## 📦 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  secure_image_viewer: ^0.0.1
