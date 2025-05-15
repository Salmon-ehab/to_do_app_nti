import 'package:get/get.dart';

abstract class MyNavigator {
  static goto(context, {required screen}) {
    Get.to(screen,
        transition: Transition.rightToLeftWithFade,
        duration: const Duration(seconds: 1));
  }

  static getOff(context, {required screen, bool isReplace = false}) {
    if (isReplace) {
      Get.offAll(screen,
          transition: Transition.rightToLeftWithFade,
          duration: const Duration(seconds: 1));
    } else {
      Get.off(screen,
          transition: Transition.rightToLeftWithFade,
          duration: const Duration(seconds: 1));
    }
  }

  static pop(context) {
    Get.back();
  }
}
