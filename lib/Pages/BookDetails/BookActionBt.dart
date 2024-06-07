import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BookActionBt extends StatelessWidget {
  const BookActionBt({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset("Assets/Icons/book.svg"),
                SizedBox(width: 15),
                Text(
                  "READ BOOK",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.background,
                        letterSpacing: 1.2,
                      ),
                ),
              ],
            ),
            Container(
              width: 3,
              height: 27,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background),
            ),
            Row(
              children: [
                SvgPicture.asset("Assets/Icons/playe.svg"),
                SizedBox(width: 10),
                Text(
                  "PLAY BOOK",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.background,
                        letterSpacing: 1.5,
                      ),
                ),
              ],
            )
          ],
        ));
  }
}
