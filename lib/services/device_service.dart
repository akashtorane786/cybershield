import 'package:device_info_plus/device_info_plus.dart';

class DeviceService {
  final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  Future<String> getDeviceInfo() async {
    final androidInfo = await _deviceInfo.androidInfo;

    return "${androidInfo.manufacturer} ${androidInfo.model} (Android ${androidInfo.version.release})";
  }
}
