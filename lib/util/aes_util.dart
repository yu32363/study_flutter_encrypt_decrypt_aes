import 'dart:convert';
import 'dart:typed_data';

import 'package:pointycastle/pointycastle.dart';

class AESUtil {
  final BlockCipher _ecipher;
  final BlockCipher _dcipher;
  final Utf8Codec _utf8Codec = const Utf8Codec(allowMalformed: false);

  AESUtil({required String secretKey, required String salt})
      : _ecipher = BlockCipher("AES/GCM"),
        _dcipher = BlockCipher("AES/GCM") {
    final Digest sha3_256 = Digest('SHA3-256');
    final Uint8List byteSecretKey =
        sha3_256.process(_utf8Codec.encode(secretKey));
    final Uint8List byteSalt = sha3_256.process(_utf8Codec.encode(salt));
    final ParametersWithIV params = ParametersWithIV(
      KeyParameter(byteSecretKey),
      byteSalt,
    );

    _ecipher.init(true, params);
    _dcipher.init(false, params);
  }

  String encryptData(String data) {
    //get String to Byte Array
    final dataByte = utf8.encode(data);
    //return byte in format Base64 String
    return base64.encode(_ecipher.process(dataByte));
  }

  String decryptData(String data) {
    //Decode Base64 String
    final dataByte = base64.decode(data);
    //return String UTF-8
    return utf8.decode(_dcipher.process(dataByte));
  }
}
