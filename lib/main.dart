import 'package:flutter/material.dart';
import 'package:study_flutter_encrypt_decrypt_aes/page/encrypt_decrypt_page.dart';

void main() => runApp(const EncryptDecryptApp());

class EncryptDecryptApp extends StatelessWidget {
  const EncryptDecryptApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: EncryptDecryptPage(),
    );
  }
}
