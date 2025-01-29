import 'package:deepseekapp/controller/deepseek_controller.dart';
import 'package:deepseekapp/presentation/common/util/app_constants.dart';
import 'package:deepseekapp/presentation/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  final DeepSeekController _deepSeekController = Get.put(DeepSeekController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("DeepSeek Chat")),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kHorizontalPadding, vertical: kVerticalPadding),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _deepSeekController.messageController,
                  decoration: InputDecoration(
                    hintText: "Type a message...",
                    isDense: true,
                    filled: true,
                    contentPadding: const EdgeInsets.all(kPadding * 1.5),
                    fillColor: Theme.of(context).cardColor,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(kRadius),
                        borderSide: BorderSide.none),
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: AppColors.kGreyColor),
                  ),
                ),
              ),
              IconButton(
                icon: _deepSeekController.isLoading
                    ? const CircularProgressIndicator()
                    : const Icon(Icons.send),
                onPressed: _deepSeekController.isLoading
                    ? null
                    : _deepSeekController.sendMessage,
              ),
            ],
          ),
        ),
        body: GetBuilder<DeepSeekController>(builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kHorizontalPadding, vertical: kVerticalPadding),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.messages.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Container(
                          padding: const EdgeInsets.all(kPadding),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(kRadius),
                              border: Border.all(color: Colors.grey)),
                          child: Text(controller.messages[index])),
                    ),
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
