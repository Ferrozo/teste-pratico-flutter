import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EmailInputField extends StatelessWidget {
  EmailInputField({super.key, required this.email, this.validator});

  TextEditingController email = TextEditingController();
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: Theme.of(context).colorScheme.onTertiary
      ),
      validator: validator,
      controller: email,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "Insira o seu email.",
        hintStyle: Theme.of(context).textTheme.labelMedium,
        filled: true,
        fillColor: Colors.grey.shade100,
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        errorStyle: TextStyle(color: Theme.of(context).colorScheme.error),
      ),
    );
  }
}
