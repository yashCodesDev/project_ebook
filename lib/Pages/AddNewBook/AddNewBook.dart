import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ebook/Components/BackButton.dart';
import 'package:project_ebook/Components/MultilineTextFormField.dart';
import 'package:project_ebook/Components/MyTextFormField.dart';
import 'package:project_ebook/Config/colors.dart';
import 'package:project_ebook/Controller/Pdf_controller.dart';
import 'package:project_ebook/Controller/book_controller.dart';
import 'package:project_ebook/Pages/ProfilePage/profile_page.dart';

class AddnewbookPage extends StatelessWidget {
  const AddnewbookPage({super.key});

  @override
  Widget build(BuildContext context) {
    Pdf_controller pdfcontroller = Get.put(Pdf_controller());
    BookController bookController = Get.put(BookController());

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
                        const SizedBox(height: 30),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const MyBackButton(),
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
                            const SizedBox(width: 70)
                          ],
                        ),
                        const SizedBox(height: 50),
                        InkWell(
                            onTap: () {
                              bookController.pickImage();
                            },
                            child: Obx(
                              () => Container(
                                height: 190,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color:
                                      Theme.of(context).colorScheme.background,
                                ),
                                child: Center(
                                  child: bookController.isImageUploading.value
                                      ? const CircularProgressIndicator(
                                          color: EColors.primaryColor,
                                        )
                                      : bookController.imageUrl.value == ""
                                          ? Image.asset(
                                              "Assets/Icons/addImage.png")
                                          : ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.network(
                                                bookController.imageUrl.value,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                ),
                              ),
                            )),
                        const SizedBox(height: 20),
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
                        child: Obx(
                          () => Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: bookController.pdfUrl.value == ""
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).colorScheme.background,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: bookController.isPdfUploading.value
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: EColors.backgroudColor,
                                    ),
                                  )
                                : bookController.pdfUrl.value == ""
                                    ? InkWell(
                                        onTap: () {
                                          bookController.pickPDF();
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            // Image.asset(
                                            //     "Assets/Icons/upload.png"),
                                            const Icon(
                                              Icons.upload_file,
                                              color: Colors.white,
                                              size: 25,
                                            ),
                                            const SizedBox(width: 8),
                                            Text(
                                              "Book PDF",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge
                                                  ?.copyWith(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .background,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : InkWell(
                                        onTap: () {
                                          bookController.pdfUrl.value = "";
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              "Assets/Icons/delete.png",
                                              width: 20,
                                            ),
                                            const SizedBox(width: 8),
                                            Text(
                                              "Delete Pdf",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge
                                                  ?.copyWith(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                          ),
                        ),
                      ),
                      // const SizedBox(
                      //   width: 10,
                      // ),
                      // Expanded(
                      //   child: Container(
                      //     padding: const EdgeInsets.all(16),
                      //     decoration: BoxDecoration(
                      //       color: Theme.of(context).colorScheme.primary,
                      //       borderRadius: BorderRadius.circular(10),
                      //     ),
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         Icon(
                      //           Icons.audio_file,
                      //           color: Theme.of(context).colorScheme.surface,
                      //         ),
                      //         const SizedBox(
                      //           width: 8,
                      //         ),
                      //         Text(
                      //           "Book Audio",
                      //           style: Theme.of(context)
                      //               .textTheme
                      //               .bodyLarge
                      //               ?.copyWith(
                      //                   color: Theme.of(context)
                      //                       .colorScheme
                      //                       .surface),
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  MytextFormField(
                    hintText: "Book title",
                    icon: Icons.book,
                    controller: bookController.title,
                  ),
                  const SizedBox(height: 10),
                  MultiLineTextField(
                      hintText: "Book Description",
                      controller: bookController.des),
                  const SizedBox(height: 10),
                  MytextFormField(
                    hintText: "Author Name",
                    icon: Icons.person,
                    controller: bookController.author,
                  ),
                  const SizedBox(height: 10),
                  MytextFormField(
                    hintText: "About Author",
                    icon: Icons.person,
                    controller: bookController.aboutAuth,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: MytextFormField(
                          hintText: "Pages",
                          icon: Icons.book,
                          controller: bookController.pages,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: MytextFormField(
                          hintText: "Language",
                          icon: Icons.language,
                          controller: bookController.language,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      // Expanded(
                      //   child: Obx(
                      //     () => DropdownButtonFormField<String>(
                      //       value: bookController.selectedCategory.value,
                      //       decoration: InputDecoration(
                      //         prefixIcon: const Icon(Icons.category),
                      //         hintText: "Category",
                      //         contentPadding: const EdgeInsets.symmetric(
                      //             vertical: 16, horizontal: 10),
                      //         border: OutlineInputBorder(
                      //           borderRadius: BorderRadius.circular(10),
                      //         ),
                      //       ),
                      //       items: bookController.categoryData
                      //           .map((category) => DropdownMenuItem<String>(
                      //                 value: category['label'],
                      //                 child: Text(category['label']!),
                      //               ))
                      //           .toList(),
                      //       onChanged: (newValue) {
                      //         bookController.selectedCategory.value = newValue!;
                      //       },
                      //     ),
                      //   ),
                      // ),
                      Expanded(
                        child: Obx(
                          () => DropdownButtonFormField<String>(
                            value:
                                bookController.selectedCategory.value.isNotEmpty
                                    ? bookController.selectedCategory.value
                                    : null, // Handle empty case gracefully
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.category),
                              hintText: "Category",
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 10),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            items: bookController.categoryData
                                .map((category) => DropdownMenuItem<String>(
                                      value: category['label'],
                                      child: Text(category['label'] ?? ''),
                                    ))
                                .toList(),
                            onChanged: (newValue) {
                              bookController.selectedCategory.value = newValue!;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(16),
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
                              const SizedBox(
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
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Obx(
                          () => Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: bookController.isPdfUploading.value
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : InkWell(
                                    onTap: () {
                                      bookController.createBook();
                                      Get.offAll(const Profilepage());
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.upload_sharp,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .background,
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          "POST",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .background,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                          ),
                        ),
                      )
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
