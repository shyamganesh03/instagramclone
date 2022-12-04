import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagramclone/components/Alert.dart';
import 'package:instagramclone/screens/dashboard_screen.dart';
import '../screens/login_screen.dart';

class Auth {
  final FirebaseAuth auth = FirebaseAuth.instance;
  getCurrentAuthenticator() {
    final currentAuthenticator = auth.currentUser;
    return currentAuthenticator;
  }

  signOut() async {
    await auth.signOut();
  }

  Future signUp(email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.to(() => const LoginScreen());
    } catch (error) {}
  }

  Future signIn(String email, String password, BuildContext context) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.to(() => const DashBoardScreen());
    } catch (error) {
      AlertBox(
          context: context,
          title: 'Error',
          description: error.toString(),
          buttonLabel: 'ok');
    }
  }

  String? isPasswordValid(String password, String confirmPassword) {
    if (password.length > 5) {
      if (!(password == confirmPassword)) {
        return 'Password not match';
      }
      return null;
    } else {
      return 'Password length must be grater than 5';
    }
  }

  String? isEmailValid(String email) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (regex.hasMatch(email)) {
      return null;
    } else {
      return 'Please Enter Valid Email';
    }
  }
}
