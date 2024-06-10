import 'package:flutter/material.dart';
import 'package:project_ebook/Components/BackButton.dart';
import 'package:project_ebook/Components/MultilineTextFormField.dart';
import 'package:project_ebook/Components/MyTextFormField.dart';
import 'package:project_ebook/Components/book_tile.dart';
import 'package:project_ebook/Models/data.dart';

class AddnewbookPage extends StatelessWidget {
  const AddnewbookPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
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
                        SizedBox(height: 30),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyBackButton(),
                            Text(
                              "ADD NEW BOOK",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background),
                            ),
                            SizedBox(width: 70)
                          ],
                        ),
                        SizedBox(height: 50),
                        Container(
                            height: 190,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Theme.of(context).colorScheme.surface,
                            ),
                            child: Icon(
                              Icons.add,
                              color: Theme.of(context).colorScheme.primary,
                            )),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.upload_sharp,
                                color: Theme.of(context).colorScheme.surface,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Book PDF",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surface),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.upload_sharp,
                                color: Theme.of(context).colorScheme.surface,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Book Audio",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surface),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  MytextFormField(
                    hintText: "Book title",
                    icon: Icons.book,
                    controller: controller,
                  ),
                  SizedBox(height: 10),
                  MultiLineTextField(
                      hintText: "Book Description", controller: controller),
                  SizedBox(height: 10),
                  MytextFormField(
                    hintText: "Author Name",
                    icon: Icons.person,
                    controller: controller,
                  ),
                  SizedBox(height: 10),
                  MytextFormField(
                    hintText: "About Author",
                    icon: Icons.person,
                    controller: controller,
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: MytextFormField(
                          hintText: "Pages",
                          icon: Icons.book,
                          controller: controller,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: MytextFormField(
                          hintText: "Price",
                          icon: Icons.currency_rupee,
                          controller: controller,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: MytextFormField(
                          hintText: "Language",
                          icon: Icons.language,
                          controller: controller,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: MytextFormField(
                          hintText: "Audio Len",
                          icon: Icons.audiotrack,
                          controller: controller,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: 2,
                                  color:
                                      Theme.of(context).colorScheme.primary)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.close,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "CANCEL",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.upload_sharp,
                                color: Theme.of(context).colorScheme.surface,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "POST",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surface),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
