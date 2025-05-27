import 'package:contactos/src/core/app_assets/app_assets.dart';
import 'package:contactos/src/core/theme/app_colors.dart';
import 'package:contactos/src/core/utils/email_validator.dart';
import 'package:contactos/src/core/utils/password_validator.dart';
import 'package:contactos/src/features/common/presentaion/components/main_text_button.dart';
import 'package:contactos/src/features/login/presentation/components/email_input_field.dart';
import 'package:contactos/src/features/login/presentation/components/password_input_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.loginBgImage),
              fit: BoxFit.cover,
            ),
          ),
          width: width,
          height: height,
          child: Column(
            children: [
              Container(
                height: 300,
                width: width,
                color: AppColors.transparent,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: width,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      Container(
                        height: 5,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.black.withAlpha(100),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      SizedBox(height: 30),
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Acessar conta",
                              style: Theme.of(context).textTheme.headlineMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 20),
                            EmailInputField(
                              email: email,
                              validator: validateEmail,
                            ),
                            SizedBox(height: 20),
                            PasswordInputField(
                              password: password,
                              validator: validatePassword,
                            ),
                            SizedBox(height: 20),
                            MainTextButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  context.go("/homeScreen");
                                }else {
                                  if (kDebugMode) {
                                    print("Deu errradooo");
                                  }

                                }
                              },
                              title: "Entrar",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
