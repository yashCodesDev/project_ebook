import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project_ebook/Components/BackButton.dart';
import 'package:project_ebook/Controller/book_controller.dart';
import 'package:project_ebook/Controller/liked_controller.dart';
import 'package:project_ebook/Models/book_model.dart';

class BookDetailsHeader extends StatelessWidget {
  final String bookId;
  final String coverUrl;
  final String title;
  final String author;
  final String description;
  final String rating;
  final String pages;
  final String language;
  final String audiolen;
  const BookDetailsHeader(
      {super.key,
      required this.coverUrl,
      required this.title,
      required this.author,
      required this.description,
      required this.rating,
      required this.pages,
      required this.language,
      required this.audiolen,
      required this.bookId});

  @override
  Widget build(BuildContext context) {
    final BookController likeController = Get.put(BookController());
    //  final book = BookModel(id: bookId, title: title, titleLowercase: title.toLowerCase());
    final book = BookModel(
      id: bookId,
      coverUrl: coverUrl,
      title: title,
      author: author,
      description: description,
      rating: rating,
      language: language,
      titleLowercase: title.toLowerCase(),
    );

    return Column(
      children: [
        const SizedBox(height: 50),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyBackButton(),
            // Obx(() {
            //   // BookModel book = likeController.wishlistBooks
            //   // BookModel? book = likeController.wishlistBooks.firstWhereOrNull(
            //   //     (b) =>
            //   //         b.id ==
            //   //         bookId); //     .firstWhere((b) => b.id == bookId);
            //   bool isLiked =
            //       likeController.wishlistBooks.any((b) => b.id == bookId);

            //   // bool isLiked = likeController.wishlistBooks.contains(book);
            //   return IconButton(
            //     icon: Icon(
            //         isLiked ? CupertinoIcons.heart_fill : CupertinoIcons.heart),
            //     onPressed: () {
            //       // likeController.toggleLikeBook(book);

            //       likeController.toggleLikeBook(book);
            //     },
            //   );
            // }),
          ],
        ),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                coverUrl,
                width: 170,
              ),
            )
          ],
        ),
        const SizedBox(height: 30),
        Text(
          title,
          maxLines: 1,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Theme.of(context).colorScheme.background),
        ),
        Text(
          "Author:$author ",
          style: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: Theme.of(context).colorScheme.background),
        ),
        const SizedBox(height: 20),
        Text(
          description,
          maxLines: 2,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: Theme.of(context).colorScheme.background),
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Column(
            //   children: [
            //     // Text(
            //     //   "Rating",
            //     //   style: Theme.of(context).textTheme.labelMedium?.copyWith(
            //     //       color: Theme.of(context).colorScheme.background),
            //     // ),
            //     Text(
            //       rating,
            //       style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            //           color: Theme.of(context).colorScheme.background),
            //     ),
            //   ],
            // ),
            Column(
              children: [
                Text(
                  "Pages",
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Theme.of(context).colorScheme.background),
                ),
                Text(
                  pages,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.background),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "Language",
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Theme.of(context).colorScheme.background),
                ),
                Text(
                  language,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.background),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "Audio",
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Theme.of(context).colorScheme.background),
                ),
                Text(
                  audiolen,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.background),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
