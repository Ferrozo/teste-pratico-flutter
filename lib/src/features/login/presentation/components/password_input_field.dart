// ignore_for_file: must_be_immutable


import 'package:flutter/material.dart';

class PasswordInputField extends StatefulWidget {
   PasswordInputField({super.key, required this.password, this.validator});

   TextEditingController password = TextEditingController();
  final String? Function(String?)? validator;

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
   bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.labelMedium,
      validator: widget.validator,
      controller: widget.password,
      obscureText: isObscure,
      decoration: InputDecoration(
        hintText: "Insira a sua senha.",
        hintStyle: Theme.of(context).textTheme.labelMedium,
        filled: true,
        fillColor: Colors.grey.shade100,
        border:  UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent
          ),
        ),
        suffixIconColor: Theme.of(context).colorScheme.onTertiary,
        enabledBorder: UnderlineInputBorder(
           borderSide: BorderSide(
            color: Colors.transparent
          ),
        ),
        errorStyle: TextStyle(color: Theme.of(context).colorScheme.error),
        suffixIcon: IconButton(onPressed: (){
          setState(() {
            isObscure = !isObscure ;
          });
        }, icon: Icon(
          isObscure? Icons.remove_red_eye_sharp: 
          Icons.remove_red_eye_outlined),
          )
      ),
    );
  }
}