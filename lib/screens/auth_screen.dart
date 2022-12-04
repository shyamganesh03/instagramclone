import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/colors.dart';
import '../components/Button.dart';
import '../components/Dropdown.dart';
import '../components/LabelText.dart';
import '../screens/login_screen.dart';
import '../screens/signup_screen.dart';
import '../utils/language.dart';

// ignore: must_be_immutable
class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});
  Language language = Language();
  ThemeColor color = ThemeColor();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: color.backgroundSurface,
        body: SafeArea(
            child: Container(
                margin: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DropDown(dropdownList: language.languageList)
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                padding: const EdgeInsets.only(bottom: 40),
                                child: const LabelText(
                                    label: 'Instagram',
                                    variant: 'secondaryTitle')),
                            Button(
                              buttonType: 'raised',
                              buttonLabel: 'Create New account',
                              handleFunction: () {
                                Get.to(() => const SignUpScreen());
                              },
                            ),
                            Button(
                              buttonType: 'flat',
                              buttonLabel: 'Log in',
                              handleFunction: () {
                                Get.to(() => const LoginScreen());
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ))));
  }
}
