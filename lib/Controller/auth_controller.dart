import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project_ebook/Config/messages.dart';
import 'package:project_ebook/Controller/book_controller.dart';
import 'package:project_ebook/Pages/HomePage/home_page.dart';
import 'package:project_ebook/Pages/welcome_page.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  BookController bookController = Get.put(BookController());
  // final user = FirebaseAuth.instance.currentUser;
  var auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();
  AuthController();
  User? get user => auth.currentUser;

  Future<void> signInWithGoogle() async {
    isLoading.value = true;
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        throw Exception("Google sign-in aborted");
      }
      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      await auth.signInWithCredential(credential);

      successMessage('Login Successful');

      Get.offAll(const HomePage());
      // bookController.getWishlistBooks();
    } catch (e) {
      // Fluttertoast.showToast(msg: e.toString());
      // errorMessage("Something went Wrong");
      print(e.toString());
      errorMessage(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signOut() async {
    try {
      await googleSignIn.signOut();
      await auth.signOut();
      // bookController.wishlistBooks.clear();
      successMessage("Log out successfully");
      Get.off(const WelcomePage());
    } catch (e) {
      errorMessage("Something went wrong!");
    }
  }
}
