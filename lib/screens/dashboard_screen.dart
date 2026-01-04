import 'package:flutter/material.dart';
import '../services/device_service.dart';
import '../services/ip_service.dart';
import '../services/security_feed_service.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final DeviceService _deviceService = DeviceService();
  final IpService _ipService = IpService();
  final SecurityFeedService _securityFeedService = SecurityFeedService();

  String deviceInfo = "Loading device info...";
  String publicIp = "Loading IP address...";
  late List<String> securityTips;

  @override
  void initState() {
    super.initState();
    securityTips = _securityFeedService.getSecurityTips();
    loadData();
  }

  void loadData() async {
    final device = await _deviceService.getDeviceInfo();
    final ip = await _ipService.getPublicIp();

    setState(() {
      deviceInfo = device;
      publicIp = ip;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('CyberShield Dashboard'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _card("📱 Device", deviceInfo),
            const SizedBox(height: 16),
            _card("🌐 Public IP", publicIp),
            const SizedBox(height: 24),

            const Text(
              "🛡️ Security Feed",
              style: TextStyle(
                color: Colors.greenAccent,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            ...securityTips.map(
                  (tip) => _feedItem(tip),
            ),
          ],
        ),
      ),
    );
  }

  Widget _card(String title, String value) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.greenAccent,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _feedItem(String text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
    );
  }
}
