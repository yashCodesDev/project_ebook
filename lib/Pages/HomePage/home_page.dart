import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ebook/Components/book_card.dart';
import 'package:project_ebook/Components/book_tile.dart';
import 'package:project_ebook/Components/my_drawer.dart';
import 'package:project_ebook/Controller/book_controller.dart';
import 'package:project_ebook/Controller/liked_controller.dart';
import 'package:project_ebook/Models/Data.dart';
import 'package:project_ebook/Models/book_model.dart';
import 'package:project_ebook/Pages/BookDetails/book_details.dart';
import 'package:project_ebook/Pages/HomePage/Widgets/app_bar.dart';
import 'package:project_ebook/Pages/HomePage/Widgets/category_widget.dart';
import 'package:project_ebook/Pages/HomePage/Widgets/my_input_textfield.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    BookController bookController = Get.put(BookController());
    // final TextEditingController searchTextController = TextEditingController();
    // LikedBooksController likeController =
    //     Get.put(LikedBooksController()); // Initialize LikeController
    // likeController.getLikedBooks();

    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      drawer: myDrawer,
      body: Obx(() {
        if (bookController.isSearching.value) {
          return _buildSearchResults(bookController, context,
              bookController.searchTextController.text);
        } else {
          bookController.searchTextController.clear();
          return _buildDefaultUI(bookController, user, context);
        }
      }),
    );
  }

  Widget _buildSearchResults(
      BookController bookController, BuildContext context, String query) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search Results',
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: GestureDetector(
          onTap: () {
            bookController.toggleSearch(false); // Update controller state
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Obx(
        () {
          if (bookController.noResultsFound.value) {
            return const Center(child: Text("OOPS! No books found"));
          } else {
            return SingleChildScrollView(
              child: Column(
                children: bookController.bookData
                    .map(
                      (e) => BookTile(
                        coverUrl: e.coverUrl!,
                        title: e.title!,
                        ontap: () {
                          Get.to(BookDetails(book: e));
                        },
                        author: e.author!,
                      ),
                    )
                    .toList(),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildDefaultUI(
      BookController bookController, User? user, BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            color: Theme.of(context).colorScheme.primary,
            child: Column(
              children: [
                const SizedBox(height: 30),
                const HomeAppBar(),
                const SizedBox(height: 50),
                Row(
                  children: [
                    Text(
                      "Hello 👋  ",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.background),
                    ),
                    Text(user?.displayName?.split(' ')[0] ?? '',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).colorScheme.background)),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        "Time to read book and enhance your knowledge",
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).colorScheme.background),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const MyInputTextField(),
                const SizedBox(height: 20),
                // Row(
                //   children: [
                //     Text(
                //       "Topics",
                //       style: Theme.of(context).textTheme.labelLarge?.copyWith(
                //             color: Theme.of(context).colorScheme.background,
                //           ),
                //     ),
                //   ],
                // ),
                const SizedBox(height: 10),
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     children: categoryData
                //         .map((e) => CategoryWidget(
                //             iconPath: e["icon"]!, btnName: e["label"]!))
                //         .toList(),
                //   ),
                // ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text(
                  "Trending",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            scrollDirection: Axis.horizontal,
            child: Obx(
              () => Row(
                children: bookController.bookData
                    .map(
                      (e) => BookCard(
                        coverUrl: e.coverUrl!,
                        title: e.title!,
                        ontap: () {
                          Get.to(BookDetails(book: e));
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text(
                  "Your Interests",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // SingleChildScrollView(
          //   padding: const EdgeInsets.symmetric(horizontal: 10),
          //   scrollDirection: Axis.horizontal,
          //   child: Obx(
          //     () => Row(
          //       children: bookController.wishlistBooks
          //           .map(
          //             (e) => BookCard(
          //               coverUrl: e.coverUrl!,
          //               title: e.title!,
          //               ontap: () {
          //                 Get.to(BookDetails(book: e));
          //               },
          //             ),
          //           )
          //           .toList(),
          //     ),
          //   ),
          // )
          // SingleChildScrollView(
          //     padding: const EdgeInsets.symmetric(horizontal: 10),
          //     scrollDirection: Axis.horizontal,
          //     child: Obx(() => bookController.wishlistBooks.isEmpty
          //         ? const Center(child: Text("No liked books yet"))
          //         : SingleChildScrollView(
          //             padding: const EdgeInsets.symmetric(horizontal: 10),
          //             scrollDirection: Axis.horizontal,
          //             child: Row(
          //               children: bookController.wishlistBooks
          //                   .map((e) => BookCard(
          //                         coverUrl: e.coverUrl!,
          //                         title: e.title!,
          //                         ontap: () => Get.to(BookDetails(book: e)),
          //                       ))
          //                   .toList(),
          //             ),
          //           )))
          Obx(() {
            return Column(
              children: bookController.bookData.map((book) {
                return BookTile(
                  coverUrl: book.coverUrl!,
                  title: book.title!,
                  author: book.author!,
                  ontap: () {
                    Get.to(BookDetails(book: book));
                  },
                );
              }).toList(),
            );
          }),
        ],
      ),
    );
  }
}
