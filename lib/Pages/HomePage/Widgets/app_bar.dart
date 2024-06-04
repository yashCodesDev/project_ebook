import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_ebook/Config/colors.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset("Assets/Icons/dashboard.svg"),
        Text(
          "E-BOOK",
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.background),
        ),
        CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.background,
          child: const Text(
            "Y",
            style: TextStyle(color: EColors.primaryColor),
          ),
        )
      ],
    );
  }
}
