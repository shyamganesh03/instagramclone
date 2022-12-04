import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/colors.dart';
import '../screens/signup_screen.dart';
import '../components/Button.dart';
import '../components/Dropdown.dart';
import '../components/LabelText.dart';
import '../components/TextField.dart';
import '../utils/Auth.dart';
import '../utils/language.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();
  bool isPassword = true;
  final authentication = Auth();

  ThemeColor color = ThemeColor();

  Language language = Language();

  @override
  void dispose() {
    super.dispose();
    email.clear();
    password.clear();
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
              child: Center(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: MediaQuery.of(context).viewInsets.bottom),
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
                        keyboardType: TextInputType.emailAddress,
                        showPassword: () {},
                      ),
                      InputField(
                        placeholder: 'Password',
                        inputController: password,
                        password: isPassword,
                        showIcon: true,
                        keyboardType: TextInputType.text,
                        showPassword: () {
                          isPassword = !isPassword;
                          setState(() {});
                        },
                      ),
                      Button(
                        buttonType: 'raised',
                        buttonLabel: 'Log In',
                        handleFunction: () {
                          authentication.signIn(
                              email.text, password.text, context);
                        },
                      ),
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
                            label: "don't have an account ?",
                            variant: 'content'),
                        SizedBox(
                          width: 80,
                          child: Button(
                            buttonLabel: 'Sign Up',
                            buttonType: 'flat',
                            handleFunction: () {
                              Get.to(() => const SignUpScreen());
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
