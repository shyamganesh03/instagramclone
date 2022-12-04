import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.placeholder,
    required this.inputController,
    required this.password,
    required this.showIcon,
    required this.keyboardType,
    this.validator,
    required this.showPassword,
  });
  final String placeholder;
  final TextEditingController inputController;
  final bool password;
  final bool showIcon;
  final String? Function(String?)? validator;
  final Function showPassword;
  final TextInputType keyboardType;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        color: Colors.grey[800],
      ),
      child: TextFormField(
        keyboardType: keyboardType,
        style: const TextStyle(color: Colors.white),
        obscureText: password,
        controller: inputController,
        decoration: InputDecoration(
          hintText: placeholder,
          suffixIcon: showIcon
              ? password
                  ? GestureDetector(
                      onTap: () => showPassword(),
                      child: const Icon(Icons.visibility_off_outlined))
                  : GestureDetector(
                      onTap: () => showPassword(),
                      child: const Icon(Icons.visibility))
              : const SizedBox(),
          hintStyle: const TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
          border: InputBorder.none,
        ),
        validator: validator,
      ),
    );
  }
}
