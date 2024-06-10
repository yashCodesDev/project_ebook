import 'package:get/get.dart';
import 'package:project_ebook/Pages/welcome_page.dart';

class Splashcontroller extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    splashController();
  }

  void splashController() {
    Future.delayed(Duration(seconds: 4), () {
      Get.offAll(WelcomePage());
    });
  }
}
