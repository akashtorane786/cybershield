import 'dart:convert';
import 'package:http/http.dart' as http;

class IpService {
  Future<String> getPublicIp() async {
    final response = await http.get(
      Uri.parse('https://api.ipify.org?format=json'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['ip'];
    } else {
      return "Unable to fetch IP";
    }
  }
}
