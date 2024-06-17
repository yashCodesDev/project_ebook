import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_ebook/Pages/HomePage/home_page.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.offAll(const HomePage());
      },
      child: Row(
        children: [
          SvgPicture.asset("Assets/Icons/back.svg"),
          const SizedBox(width: 10),
          Text(
            "Back",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.background,
                ),
          )
        ],
      ),
    );
  }
}
