import 'package:flutter/material.dart';
import 'package:project_ebook/Config/colors.dart';

class PrimaryButton extends StatelessWidget {
  final String btnName;
  final VoidCallback ontap;

  const PrimaryButton({
    super.key,
    required this.btnName,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 55,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: EColors.backgroudColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset("Assets/Icons/google.png"),
            ),
            const SizedBox(width: 10),
            Text(
              btnName,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.background),
            )
          ],
        ),
      ),
    );
  }
}
