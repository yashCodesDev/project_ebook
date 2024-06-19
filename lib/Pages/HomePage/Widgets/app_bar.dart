import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_ebook/Config/colors.dart';
import 'package:project_ebook/Pages/ProfilePage/profile_page.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: SvgPicture.asset("Assets/Icons/dashboard.svg")),
        Text(
          "E-BOOK",
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.background),
        ),
        InkWell(
          onTap: () {
            Get.to(const Profilepage());
          },
          child: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.background,
            child: Text(
              user?.displayName?.substring(0, 1) ?? " ",
              style: const TextStyle(color: EColors.primaryColor),
            ),
          ),
        )
      ],
    );
  }
}
