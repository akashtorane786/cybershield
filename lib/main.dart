import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/lock_provider.dart';
import 'screens/auth_gate.dart';
import 'screens/dashboard_screen.dart';
import 'screens/vault_screen.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => LockProvider(),
      child: const CyberShieldApp(),
    ),
  );
}

class CyberShieldApp extends StatelessWidget {
  const CyberShieldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const HomeRouter(),
    );
  }
}

class HomeRouter extends StatelessWidget {
  const HomeRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: const DashboardScreen(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        child: const Icon(Icons.lock),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const GateKeeper()),
          );
        },
      ),
    );
  }
}

class GateKeeper extends StatelessWidget {
  const GateKeeper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: ElevatedButton(
          child: const Text("Authenticate to Enter Vault"),
          onPressed: () async {
            final auth = await Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AuthGate()),
            );

            if (auth == true) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const VaultScreen()),
              );
            }
          },
        ),
      ),
    );
  }
}
