import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_ebook/Config/messages.dart';
import 'package:project_ebook/Models/book_model.dart';
import 'package:uuid/uuid.dart';

class BookController extends GetxController {
  final TextEditingController title = TextEditingController();
  final TextEditingController searchTextController = TextEditingController();
  final TextEditingController des = TextEditingController();
  final TextEditingController author = TextEditingController();
  final TextEditingController aboutAuth = TextEditingController();
  final TextEditingController pages = TextEditingController();
  final TextEditingController category = TextEditingController();
  final TextEditingController language = TextEditingController();
  final TextEditingController price = TextEditingController();
  final ImagePicker imagePicker = ImagePicker();
  final storage = FirebaseStorage.instance;
  final db = FirebaseFirestore.instance;
  final fAuth = FirebaseAuth.instance;
  final RxString imageUrl = ''.obs;
  final RxString pdfUrl = ''.obs;
  final RxBool isImageUploading = false.obs;
  final RxBool isPdfUploading = false.obs;
  final RxBool isPostUploading = true.obs;
  final RxList<BookModel> bookData = <BookModel>[].obs;
  final RxList<BookModel> currentUserBooks = <BookModel>[].obs;
  final RxBool isLoadingBooks = true.obs;
  RxBool isSearching = false.obs;
  // var suggestions = <String>[].obs;
  var wishlistBooks = <BookModel>[].obs;
  final RxString selectedCategory = ''.obs;
  var categoryData = [
    {
      "icon": "Assets/Icons/science-atoms.svg",
      "label": "Science",
    },
    {
      "icon": "Assets/Icons/bank.svg",
      "label": "Commerce",
    },
    {
      "icon": "Assets/Icons/world.svg",
      "label": "Literature",
    },
    {
      "icon": "Assets/Icons/heart.svg",
      "label": "Computer",
    },
  ];

  @override
  void onInit() {
    super.onInit();
    getAllBooks();
    getWishlistBooks();
  }

  void getAllBooks() async {
    bookData.clear();
    final books = await db.collection('Books').get();
    for (final book in books.docs) {
      bookData.add(BookModel.fromJson(book.data()));
    }
  }

  void filterBooksByCategory(String category) {
    bookData.clear();
    if (category == 'All') {
      bookData.assignAll(bookData); // Show all user's books
    } else {
      // Filter books by category
      for (final book in bookData) {
        if (book.category?.toLowerCase() == category.toLowerCase()) {
          bookData.add(book);
        }
      }
    }
  }

  void getUserBook() async {
    currentUserBooks.clear();
    final books = await db
        .collection('userBook')
        .doc(fAuth.currentUser!.uid)
        .collection('Books')
        .get();
    for (final book in books.docs) {
      currentUserBooks.add(BookModel.fromJson(book.data()));
    }
    isLoadingBooks.value = false;
  }

  RxBool noResultsFound = false.obs;

  // Other existing properties and methods...

  void searchBooks(String query) async {
    bookData.clear();
    isSearching.value = true;
    noResultsFound.value = false;

    if (query.isEmpty) {
      resetSearch();
    } else {
      try {
        final books = await FirebaseFirestore.instance
            .collection('Books')
            .where('titleLowerCase',
                isGreaterThanOrEqualTo: query.toLowerCase())
            .where('titleLowerCase',
                isLessThanOrEqualTo: '${query.toLowerCase()}\uf8ff')
            .get();

        // Process the query results
        if (books.docs.isEmpty) {
          noResultsFound.value = true;
        } else {
          for (final book in books.docs) {
            bookData.add(BookModel.fromJson(book.data()));
          }
        }
      } catch (e) {
        print('Error searching books: $e');
        // Handle error if needed
      }
    }
  }

  void resetSearch() {
    isSearching.value = false;
    noResultsFound.value = false;
    // Optionally clear bookData if you don't want to keep previous search results
    getAllBooks();
    // bookData.clear();
  }

  void toggleSearch(bool searching) {
    isSearching.value = searching;
    if (!searching) {
      resetSearch();
    }
  }

  void pickImage() async {
    isImageUploading.value = true;
    final XFile? image =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final file = File(image.path);
      uploadImageToFirebase(file);
    }
    isImageUploading.value = false;
  }

  void uploadImageToFirebase(File image) async {
    try {
      const uuid = Uuid();
      final filename = uuid.v1();
      final storageRef = storage.ref().child('Images/$filename');
      final response = await storageRef.putFile(image);
      final downloadURL = await response.ref.getDownloadURL();
      imageUrl.value = downloadURL;
      print('Download URL: $downloadURL');
    } catch (e) {
      errorMessage('Failed to upload image');
    } finally {
      isImageUploading.value = false;
    }
  }

  bool isNumeric(String str) {
    return RegExp(r'^[0-9]+$').hasMatch(str);
  }

  void createBook() async {
    isPostUploading.value = true;
    if (pages.text.isEmpty || !isNumeric(pages.text)) {
      errorMessage('Invalid number of pages');
      isPostUploading.value = false;
      return;
    }

    final newBook = BookModel(
      id: '${bookData.length + 1}',
      title: title.text,
      titleLowerCase: title.text.toLowerCase(),
      description: des.text,
      coverUrl: imageUrl.value,
      bookurl: pdfUrl.value,
      author: author.text,
      aboutAuthor: aboutAuth.text,
      pages: int.parse(pages.text),
      language: language.text,
      audioUrl: '',
      rating: '',
      category: selectedCategory.value,
    );

    await db.collection('Books').add(newBook.toJson());
    addBookInUserDb(newBook);
    isPostUploading.value = false;

    title.clear();
    des.clear();
    aboutAuth.clear();
    pages.clear();
    language.clear();
    category.clear();
    author.clear();
    price.clear();
    imageUrl.value = '';
    pdfUrl.value = '';

    successMessage('Book added to the database');
    getAllBooks();
    getUserBook();
  }

  void pickPDF() async {
    isPdfUploading.value = true;
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      final file = File(result.files.first.path!);
      if (file.existsSync()) {
        final fileBytes = await file.readAsBytes();
        final fileName = result.files.first.name;
        final response =
            await storage.ref().child('Pdf/$fileName').putData(fileBytes);
        final downloadURL = await response.ref.getDownloadURL();
        pdfUrl.value = downloadURL;
        // print(downloadURL);
      } else {
        print('File does not exist');
      }
    } else {
      print('No file selected');
    }
    isPdfUploading.value = false;
  }

  void addBookInUserDb(BookModel book) async {
    await db
        .collection('userBook')
        .doc(fAuth.currentUser!.uid)
        .collection('Books')
        .add(book.toJson());
  }

  // // Fetch wishlist books from Firestore

  // // Add a book to the wishlist
  // void addToWishlist(BookModel book) async {
  //   try {
  //     await db
  //         .collection('userWishlist')
  //         .doc(fAuth.currentUser!.uid)
  //         .collection('Books')
  //         .doc(book.id)
  //         .set(book.toJson());
  //     wishlistBooks.add(book);
  //     successMessage('Book added to wishlist');
  //   } catch (e) {
  //     print('Error adding to wishlist: $e');
  //     errorMessage('Failed to add book to wishlist');
  //   }
  // }

  // // Remove a book from the wishlist
  // void removeFromWishlist(BookModel book) async {
  //   try {
  //     await db
  //         .collection('userWishlist')
  //         .doc(fAuth.currentUser!.uid)
  //         .collection('Books')
  //         .doc(book.id)
  //         .delete();
  //     wishlistBooks.removeWhere((b) => b.id == book.id);
  //     successMessage('Book removed from wishlist');
  //   } catch (e) {
  //     print('Error removing from wishlist: $e');
  //     errorMessage('Failed to remove book from wishlist');
  //   }
  // }

  // void toggleLikeBook(BookModel book) {
  //   if (wishlistBooks.any((b) => b.id == book.id)) {
  //     removeFromWishlist(book);
  //   } else {
  //     addToWishlist(book);
  //   }
  // }

  void getWishlistBooks() async {
    wishlistBooks.clear();
    String userId = fAuth.currentUser!.uid;
    final books =
        await db.collection('users').doc(userId).collection('wishlist').get();
    for (final book in books.docs) {
      wishlistBooks.add(BookModel.fromJson(book.data()));
    }
  }
  // void getWishlistBooks() async {
  //   wishlistBooks.clear();
  //   String userId = fAuth.currentUser!.uid;
  //   final books = await db
  //       .collection('userWishlist')
  //       .doc(userId)
  //       .collection('Books')
  //       .get();
  //   for (final book in books.docs) {
  //     wishlistBooks.add(BookModel.fromJson(book.data()));
  //   }
  // }

  Future<void> addToWishlist(BookModel book) async {
    try {
      await db
          .collection('users')
          .doc(fAuth.currentUser!.uid)
          .collection('wishlist')
          .doc(book.id)
          .set(book.toJson());
      wishlistBooks.add(book);
      successMessage('Book added to wishlist');
    } catch (e) {
      print('Error adding to wishlist: $e');
      errorMessage('Failed to add book to wishlist');
    }
  }

  Future<void> removeFromWishlist(BookModel book) async {
    try {
      await db
          .collection('users')
          .doc(fAuth.currentUser!.uid)
          .collection('wishlist')
          .doc(book.id)
          .delete();
      wishlistBooks.removeWhere((b) => b.id == book.id);
      successMessage('Book removed from wishlist');
    } catch (e) {
      print('Error removing from wishlist: $e');
      errorMessage('Failed to remove book from wishlist');
    }
  }

  void toggleLikeBook(BookModel book) {
    if (wishlistBooks.any((b) => b.id == book.id)) {
      removeFromWishlist(book);
    } else {
      addToWishlist(book);
    }
  }
  // void toggleLikeBook(BookModel book) {
  //   // Check if book is already in wishlist
  //   bool isInWishlist = wishlistBooks.any((b) => b.id == book.id);

  //   if (isInWishlist) {
  //     removeFromWishlist(book);
  //   } else {
  //     addToWishlist(book);
  //   }
  // }

  // Future<void> deleteBook(String bookId) async {
  //   try {
  //     await FirebaseFirestore.instance
  //         .collection('userBooks')
  //         .doc(FirebaseAuth.instance.currentUser!.uid)
  //         .collection('Books')
  //         .doc(bookId)
  //         .delete();
  //     await FirebaseFirestore.instance.collection('Books').doc(bookId).delete();

  //     // Show success message (optional)
  //   } catch (error) {
  //     // Handle deletion error (e.g., show error message)
  //     print(error);
  //   }
  // }
  // Future<void> deleteBook(String bookId) async {
  //   final firestore = FirebaseFirestore.instance;
  //   final batch = firestore.batch();

  //   final userBooksRef = firestore
  //       .collection('userBooks')
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .collection('Books')
  //       .doc(bookId);

  //   final mainBooksRef = firestore.collection('Books').doc(bookId);

  //   batch.delete(userBooksRef);
  //   batch.delete(mainBooksRef);

  //   try {
  //     await batch.commit();
  //     // Show success message (optional)
  //   } catch (error) {
  //     // Handle deletion error (e.g., show error message)
  //     print(error);
  //   }
  // }
  // Future<void> deleteBook(String bookId) async {
  //   try {
  //     final firestore = FirebaseFirestore.instance;
  //     final batch = firestore.batch();

  //     final userBooksRef = firestore
  //         .collection('userBooks')
  //         .doc(FirebaseAuth.instance.currentUser!.uid)
  //         .collection('Books')
  //         .doc(bookId);

  //     final mainBooksRef = firestore.collection('Books').doc(bookId);

  //     batch.delete(userBooksRef);
  //     batch.delete(mainBooksRef);

  //     await batch.commit();
  //     successMessage("Delete Successfull");
  //     // Optionally, update local state or show success message
  //   } catch (e) {
  //     print('Error deleting book: $e');
  //     // Handle error gracefully, show error message, etc.
  //   }
  // }
  bool success = false;
  Future<void> deleteBook(String bookId) async {
    try {
      // Delete from user's collection
      // await firestore
      //     .collection('userBook')
      //     .doc(fAuth.currentUser!.uid)
      //     .collection('Books')
      //     .doc(bookId)
      //     .delete();

      // Delete from main collection
      await FirebaseFirestore.instance.collection('Books').doc(bookId).delete();

      // Delete from user's collection
      await FirebaseFirestore.instance
          .collection('userBook')
          .doc(fAuth.currentUser!.uid)
          .collection('Books')
          .doc(bookId)
          .delete();

      successMessage("Book deleted successfully");
      success = true;

      if (success) {
        currentUserBooks.removeWhere((book) => book.id == bookId);
        bookData.removeWhere((book) => book.id == bookId);
      }
    } catch (e) {
      print('Error deleting book: $e');
      errorMessage("Something went wrong");
      // Handle error gracefully, show error message, etc.
    }
  }
}
