import 'package:deepseekapp/controller/deepseek_controller.dart';
import 'package:get/get.dart';

class DeepSeekBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DeepSeekController());
  }
}
