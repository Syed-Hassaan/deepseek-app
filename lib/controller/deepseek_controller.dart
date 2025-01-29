import 'package:deepseekapp/services/deepseek_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

class DeepSeekController extends GetxController {
  final TextEditingController messageController = TextEditingController();
  final List<String> messages = [];
  final DeepSeekService _apiService =
      DeepSeekService(dotenv.get("DEEPSEEK_API_KEY"));
  bool isLoading = false;

  void sendMessage() async {
    if (messageController.text.isEmpty) return;

    messages.add("You: ${messageController.text}");
    isLoading = true;
    update();

    try {
      final response =
          await _apiService.getChatResponse(messageController.text);
      messages.add("DeepSeek: $response");
      update();
    } catch (e) {
      // Get.showSnackbar(GetSnackBar(title: "Error: $e"));
      debugPrint("Error: $e");
    } finally {
      isLoading = false;
      messageController.clear();
      update();
    }
  }
}
