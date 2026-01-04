import 'package:flutter/material.dart';

class VaultScreen extends StatelessWidget {
  const VaultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Secure Vault"),
      ),
      body: const Center(
        child: Text(
          "🔒 Secure Vault\n\nProtected Content Here",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.greenAccent,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

