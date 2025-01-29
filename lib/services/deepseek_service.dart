import 'dart:convert';
import 'package:http/http.dart' as http;

class DeepSeekService {
  static const String _baseUrl = "https://api.deepseek.com/v1";
  final String _apiKey;

  DeepSeekService(this._apiKey);

  Future<String> getChatResponse(String prompt) async {
    try {
      final response = await http.post(
        Uri.parse("$_baseUrl/chat/completions"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $_apiKey",
        },
        body: jsonEncode({
          "model": "deepseek-chat",
          "messages": [
            {"role": "user", "content": prompt}
          ],
          "temperature": 0.7,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['choices'][0]['message']['content'];
      } else {
        throw Exception("API Error: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Failed to fetch response: $e");
    }
  }
}
