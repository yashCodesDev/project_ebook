import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:project_ebook/Pages/HomePage/home_page.dart';
import 'package:project_ebook/Pages/welcome_page.dart';

class Splashcontroller extends GetxController {
  @override
  void onInit() {
    super.onInit();
    splashController();
  }

  void splashController() {
    Future.delayed(const Duration(seconds: 4), () {
      // Get.offAll(WelcomePage());
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // If user is signed in, navigate to HomePage
        Get.offAll(() => const HomePage());
      } else {
        // If user is not signed in, navigate to WelcomePage
        Get.offAll(() => const WelcomePage());
      }
    });
  }
}
