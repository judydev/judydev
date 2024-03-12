import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:judydev/header.dart';
import 'package:judydev/projects_view.dart';
import 'dart:html' as html;

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        bottomNavigationBar: Container(
          height: 90,
          alignment: Alignment.center,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Divider(
                    thickness: 3,
                    color: Theme.of(context).shadowColor.withOpacity(0.2)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedIcon(
                      img: 'GitHub.png',
                      onTap: () {
                        if (kIsWeb) {
                          html.window
                              .open("https://github.com/judydev", 'GitHub');
                        }
                      }),
                  SizedIcon(
                      img: 'LinkedIn.png',
                      onTap: () {
                        if (kIsWeb) {
                          html.window.open(
                              "https://www.linkedin.com/in/judydev/",
                              "LinkedIn");
                        }
                      }),
                  SizedIcon(
                    img: "Medium.png",
                    onTap: () {
                      if (kIsWeb) {
                        html.window
                            .open("https://medium.com/@judydev", "Medium");
                      }
                    },
                  )
                ],
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Column(children: [
            const Header(),
            const MySummary(),
            const SizedBox(height: 50),
            InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const Dialog(
                          clipBehavior: Clip.antiAlias,
                          child: ProjectsView(),
                        );
                      });
                },
                child: Text('My Works',
                    style: GoogleFonts.orbitron(
                        textStyle: TextStyle(
                            fontSize: 32,
                            backgroundColor: Theme.of(context)
                                .shadowColor
                                .withOpacity(0.2))))),
          ])),
        ));
  }
}

class SizedIcon extends StatelessWidget {
  const SizedIcon({super.key, required this.img, required this.onTap});
  final String img;
  final void Function()? onTap;

  final double iconSize = 36;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
          onPressed: onTap,
          icon: Image.asset(img,
              color: img == 'GitHub.png' ? Colors.black : null,
              width: iconSize,
              height: iconSize)),
    );
  }
}
