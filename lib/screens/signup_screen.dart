import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/colors.dart';
import '../screens/login_screen.dart';
import '../components/Button.dart';
import '../components/Dropdown.dart';
import '../components/LabelText.dart';
import '../components/TextField.dart';
import '../utils/Auth.dart';
import '../utils/language.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  final TextEditingController confirmPassword = TextEditingController();

  Auth authentication = Auth();
  final formKey = GlobalKey<FormState>();
  bool passwordMatch = true;

  Language language = Language();
  ThemeColor color = ThemeColor();

  @override
  void dispose() {
    super.dispose();
    email.clear();
    password.clear();
    confirmPassword.clear();
  }

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
                children: [DropDown(dropdownList: language.languageList)],
              ),
            ),
            Expanded(
              child: Form(
                key: formKey,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          padding: const EdgeInsets.only(bottom: 40),
                          child: const LabelText(
                              label: 'Instagram', variant: 'secondaryTitle')),
                      InputField(
                        placeholder: 'Email Id',
                        inputController: email,
                        password: false,
                        showIcon: false,
                        validator: (_) =>
                            authentication.isEmailValid(email.text),
                        keyboardType: TextInputType.emailAddress,
                        showPassword: () {},
                      ),
                      InputField(
                        placeholder: 'Password',
                        inputController: password,
                        password: true,
                        showIcon: true,
                        keyboardType: TextInputType.text,
                        showPassword: () {},
                      ),
                      InputField(
                        placeholder: 'Re-Enter Password',
                        inputController: confirmPassword,
                        password: true,
                        showIcon: true,
                        keyboardType: TextInputType.text,
                        validator: (_) => authentication.isPasswordValid(
                            password.text, confirmPassword.text),
                        showPassword: () {},
                      ),
                      Button(
                          buttonType: 'raised',
                          buttonLabel: 'Sign Up',
                          handleFunction: () =>
                              formKey.currentState!.validate()),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Divider(
                  height: 1,
                  color: Colors.white,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const LabelText(
                            label: "Already have an account?",
                            variant: 'content'),
                        SizedBox(
                          width: 80,
                          child: Button(
                            buttonLabel: 'Log In',
                            buttonType: 'flat',
                            handleFunction: () {
                              Get.to(() => const LoginScreen());
                            },
                          ),
                        )
                      ]),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
