import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:project_ebook/Components/BackButton.dart';
import 'package:project_ebook/Components/book_tile.dart';
import 'package:project_ebook/Components/profile_book_tile.dart';
import 'package:project_ebook/Config/colors.dart';
import 'package:project_ebook/Controller/auth_controller.dart';
import 'package:project_ebook/Controller/book_controller.dart';
import 'package:project_ebook/Pages/AddNewBook/AddNewBook.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    BookController bookController = Get.put(BookController());
    AuthController authController = Get.put(AuthController());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      bookController.getUserBook();
    });

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(const AddnewbookPage());
        },
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.primary,
        ), // background -> replaced by -> surface
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // height: 450,
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              color: Theme.of(context).colorScheme.primary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const MyBackButton(),
                            Text(
                              "Profile",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .surface),
                            ),
                            IconButton(
                              onPressed: () {
                                authController.signOut();
                              },
                              icon: Icon(
                                Icons.exit_to_app,
                                color: Theme.of(context).colorScheme.background,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 50),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                width: 2,
                                color: Theme.of(context)
                                    .colorScheme
                                    .surface, // background -> replaced by -> surface
                              )),
                          child: Container(
                            width: 120,
                            height: 120,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.network(
                                  user!.photoURL!,
                                  fit: BoxFit.cover,
                                )),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          user.displayName!.trim(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  color: Theme.of(context).colorScheme.surface),
                        ), // background -> replaced by -> surface

                        Text(
                          user.email.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .surfaceVariant),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Your Books",
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(fontSize: 25),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Obx(() {
                    if (bookController.isLoadingBooks.value) {
                      // Show a loading indicator while fetching data
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return bookController.currentUserBooks.isEmpty
                          ? Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SizedBox(
                                height: 150,
                                width: double.infinity,
                                child: Text(
                                  "Ready to start your e-book journey ? Add your first contribution now!",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500,
                                          color: EColors.labelColor),
                                ),
                              ),
                            )
                          : Column(
                              children: bookController.currentUserBooks
                                  .map((e) => BookTile(
                                        title: e.title!,
                                        coverUrl: e.coverUrl!,
                                        author: e.author!,
                                        ontap: () {},
                                      ))
                                  .toList(),
                            );
                    }
                  })
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
