import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
      "Busca la comida......",
      "Pariatur tempor ea veniam ut duis esse excepteur sint excepteur veniam.",
      "assets/images/1.png"),
  SlideInfo(
      "Entrega rapida.......",
      "Nisi exercitation dolor duis consequat velit commodo id consectetur.",
      "assets/images/2.png"),
  SlideInfo(
      "Disfruta la comida",
      "Labore velit Lorem ex culpa mollit laborum proident labore sit occaecat ",
      "assets/images/3.png"),
];

class AppTutorialScreen extends StatefulWidget {
  static const String name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();

  bool endReached = false;

  @override
  void initState() {
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
      print('${pageViewController.page}');
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            PageView(
                controller: pageViewController,
                physics: const BouncingScrollPhysics(),
                children: slides
                    .map((slideData) => _Slide(
                        title: slideData.title,
                        caption: slideData.caption,
                        imageUrl: slideData.imageUrl))
                    .toList()),
            Positioned(
                top: 50,
                right: 20,
                child: TextButton(
                    onPressed: () => context.pop(), child: Text("Salir"))),
            endReached
                ? Positioned(
                    bottom: 30,
                    right: 20,
                    child: FadeInRight(
                      from: 15,
                      delay: const Duration(milliseconds: 400),
                      child: FilledButton(
                          onPressed: () => context.pop(),
                          child: Text('Continuar')),
                    ))
                : const SizedBox()
          ],
        ));
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(image: AssetImage(imageUrl)),
              const SizedBox(height: 20),
              Text(title, style: titleStyle),
              const SizedBox(height: 10),
              Text(caption, style: captionStyle),
            ],
          ),
        ));
  }
}
