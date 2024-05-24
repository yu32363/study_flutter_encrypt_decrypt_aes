import 'dart:convert';
import 'dart:typed_data';

import 'package:pointycastle/pointycastle.dart';

class AESUtil {
  late BlockCipher _ecipher, _dcipher;
  AESUtil({required String secretKey, required String salt}) {
    const String algoGCM = "AES/GCM";
    Digest sha3_256 = Digest('SHA3-256');
    Uint8List byteSecretKey = sha3_256.process(utf8.encode(secretKey));
    Uint8List byteSalt = sha3_256.process(utf8.encode(salt));
    ParametersWithIV params =
        ParametersWithIV(KeyParameter(byteSecretKey), byteSalt);
    _ecipher = BlockCipher(algoGCM)..init(true, params);
    _dcipher = BlockCipher(algoGCM)..init(false, params);
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
