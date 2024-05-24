import 'package:flutter/material.dart';
import 'package:study_flutter_encrypt_decrypt_aes/constant/aes_constant.dart';
import 'package:study_flutter_encrypt_decrypt_aes/util/aes_util.dart';

class EncryptDecryptPage extends StatefulWidget {
  const EncryptDecryptPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EncryptDecryptPageState createState() => _EncryptDecryptPageState();
}

class _EncryptDecryptPageState extends State<EncryptDecryptPage> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _resultController = TextEditingController();
  final TextEditingController _controllerJava = TextEditingController();
  final TextEditingController _resultControllerJava = TextEditingController();
  late AESUtil _aesUtil;

  @override
  void initState() {
    super.initState();
    _controllerJava.text =
        "kt0f7uwJzsunqEktgq2n4SrC15OKUftlHeamCgMTmREv6SKZ3KGuooPRk6QpMmr2vyuhaE34edsT6LpGcgSe84TQxbhEKPBa9x591R4kPQVgdPnAtisUdHXSVaw814gE";
  }

  AESUtil initAesUtil() {
    return AESUtil(secretKey: secretKey, salt: salt);
  }

  void _encrypt() {
    setState(() {
      _aesUtil = initAesUtil();
      _resultController.text = _aesUtil.encryptData(_controller.text);
    });
  }

  void _decrypt() {
    setState(() {
      _aesUtil = initAesUtil();
      _resultController.text = _aesUtil.decryptData(_controller.text);
    });
  }

  void _clear() {
    setState(() {
      _resultController.text = "";
      _controller.text = "";
    });
  }

  void _encryptJava() {
    setState(() {
      _aesUtil = initAesUtil();
      _resultControllerJava.text = _aesUtil.encryptData(_controllerJava.text);
    });
  }

  void _decryptJava() {
    setState(() {
      _aesUtil = initAesUtil();
      _resultControllerJava.text = _aesUtil.decryptData(_controllerJava.text);
    });
  }

  void _clearJava() {
    setState(() {
      _resultControllerJava.text = "";
      _controllerJava.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(
                      12.0), // Optional: if you want rounded corners
                ),
                child: Column(
                  children: <Widget>[
                    const Text(
                      'Encrypt Decrypt App',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter text',
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: _encrypt,
                          child: const Text('Encrypt'),
                        ),
                        ElevatedButton(
                          onPressed: _decrypt,
                          child: const Text('Decrypt'),
                        ),
                        ElevatedButton(
                          onPressed: _clear,
                          child: const Text('Clear'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _resultController,
                      readOnly: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Result',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 90,
                width: 50,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(
                      12.0), // Optional: if you want rounded corners
                ),
                child: Column(
                  children: <Widget>[
                    const Text(
                      'Encrypt Decrypt simple data form JAVA',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextField(
                      controller: _controllerJava,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter text',
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: _encryptJava,
                          child: const Text('Encrypt'),
                        ),
                        ElevatedButton(
                          onPressed: _decryptJava,
                          child: const Text('Decrypt'),
                        ),
                        ElevatedButton(
                          onPressed: _clearJava,
                          child: const Text('Clear'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _resultControllerJava,
                      readOnly: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Result',
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
