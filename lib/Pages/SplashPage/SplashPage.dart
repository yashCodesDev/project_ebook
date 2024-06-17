import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:project_ebook/Controller/SplashController.dart';
import 'package:project_ebook/Controller/book_controller.dart';

class Splashpage extends StatelessWidget {
  const Splashpage({super.key});

  @override
  Widget build(BuildContext context) {
    Splashcontroller splashcontroller = Get.put(Splashcontroller());
    BookController bookController = Get.put(BookController());

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Lottie.asset("Assets/Animation/Anim3.json"),
      ),
    );
  }
}
