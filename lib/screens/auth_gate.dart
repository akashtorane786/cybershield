import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/lock_provider.dart';
import '../services/auth_service.dart';


class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = AuthService();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: ElevatedButton(
          child: const Text("Unlock Vault"),
          onPressed: () async {
            final success = await authService.authenticate();

            if (success) {
              Provider.of<LockProvider>(context, listen: false).unlock();
              Navigator.pop(context, true);
            } else {
              Navigator.pop(context, false);
            }
          },
        ),
      ),
    );
  }
}
