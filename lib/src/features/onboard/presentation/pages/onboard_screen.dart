import 'package:contactos/src/core/app_assets/app_assets.dart';
import 'package:contactos/src/features/common/presentaion/components/main_text_button.dart';
import 'package:contactos/src/features/onboard/domain/entities/onboard_entity.dart';
import 'package:contactos/src/features/onboard/presentation/components/dotted_widget.dart';
import 'package:contactos/src/features/onboard/presentation/components/onboard_content.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  late PageController _pageController;

  int _pageIndex = 0;

  final List<OnboardEntity> demoData = [
    OnboardEntity(
      image: AppAssets.onboard01,
      title: "Bem-vindo ao Contacto! 👋🏽 ",
      description:
          "Seu aplicativo de gerenciamento de contactos de maneira mais fácil.",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: PageView.builder(
          itemBuilder: (_, indext) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: PageView.builder(
                    onPageChanged: (index) {
                      setState(() {
                        _pageIndex = index;
                      });
                    },
                    itemCount: demoData.length,
                    controller: _pageController,
                    itemBuilder: (context, index) =>
                        OnboardContent(onboard: demoData[index]),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(
                      demoData.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: DottedWidget(isActive: index == _pageIndex),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: MainTextButton(
                    onPressed: () {
                      context.go('/loginPage');
                    },
                    title: 'Começar',
                  ),
                ),

                const SizedBox(height: 60),
              ],
            );
          },
        ),
      ),
    );
  }
}
