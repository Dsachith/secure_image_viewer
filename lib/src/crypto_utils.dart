import 'dart:typed_data';
import 'package:encrypt/encrypt.dart';

Uint8List decryptAES(Uint8List encrypted, String key, String iv) {
  final encrypter = Encrypter(AES(Key.fromUtf8(key), mode: AESMode.cbc));
  final decrypted = encrypter.decryptBytes(Encrypted(encrypted), iv: IV.fromUtf8(iv));
  return Uint8List.fromList(decrypted);
}
