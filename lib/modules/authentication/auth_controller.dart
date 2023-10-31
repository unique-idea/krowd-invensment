import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:krowd_invesment_footer/pages/login/first_time.dart';
import 'package:krowd_invesment_footer/pages/login/signin_page.dart';
import 'package:krowd_invesment_footer/pages/login/widgets/user_services.dart';

import '../../pages/home/dashboard.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;
  Rx<Response> authenticateBody = Rx<Response>(const Response());

  static dynamic token;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) async {
    if (user == null) {
      Get.offAll(() => const SignInPage());
    } else {
      debugPrint(user.email);
    }
  }

  void logout() async {
    await auth.signOut();
  }

  signInWithGoogle() async {
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    final User? user = userCredential.user;
    if (user != null) {
      final firebaseIdToken = await user.getIdTokenResult(true);
      token = firebaseIdToken.token;
      await authenticateBackEnd(token);
      log("Token: $token");
      final responseBody = authenticateBody.value.body;
      final bodyJson = jsonDecode(responseBody);
      final status = bodyJson['status'];
      if (status == "FILLING_REQUIRED") {
        Get.offAll(() => const FirstTime());
      } else {
        Get.offAll(() => DashBoard(
              email: user.email,
              index: 0,
            ));
      }
    } else {
      log('Firebase ID token: NULL');
      Get.offAll(() => const SignInPage());
    }

    return await auth.signInWithCredential(credential);
  }

  Future<void> authenticateBackEnd(var firebaseIdToken) async {
    final getResponse = await UserService.authenticateBackEnd(firebaseIdToken);
    final getResponseBody = getResponse.body;
    final getResponseStatus = getResponse.statusCode;

    authenticateBody.value = Response(
      body: getResponseBody,
      statusCode: getResponseStatus,
    );
  }

  void register(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar("About user", "User message",
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            "Account creation failed",
            style: TextStyle(color: Colors.white),
          ),
          messageText: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ));
    }
  }

  void forgetPassword(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }

  handleAuthState() {
    return StreamBuilder(
        stream: auth.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            // return const Home();
            return const FirstTime();
          } else {
            return const SignInPage();
          }
        });
  }

  void login(String emailController, passwordController) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: emailController, password: passwordController);
    } catch (e) {
      Get.snackbar("About login", "Login message",
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            "Login failed",
            style: TextStyle(color: Colors.white),
          ),
          messageText: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ));
    }
  }
}
