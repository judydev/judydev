import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:judydev/data.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:html' as html;

class ProjectsView extends StatefulWidget {
  const ProjectsView({super.key});

  @override
  State<ProjectsView> createState() => _ProjectsViewState();
}

class _ProjectsViewState extends State<ProjectsView> {
  final _controller = PageController(initialPage: 0, viewportFraction: 0.8);
  late String _title = titleList[0];

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.page! < 0.5) {
        setState(() {
          _title = titleList[0];
        });
      } else if (_controller.page! >= 0.5 && _controller.page! < 1.5) {
        setState(() {
          _title = titleList[1];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      width: MediaQuery.sizeOf(context).width,
      color: Theme.of(context).canvasColor.withOpacity(0.7),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
           Text('My Works', style: GoogleFonts.orbitron(textStyle: const TextStyle(fontSize: 24)),),
          SizedBox(
              height: 300,
              width: MediaQuery.sizeOf(context).width * 0.7,
              child: PageView(
                controller: _controller,
                children: titleList
                    .map((title) => ProjectView(title: title))
                    .toList(),
              )),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: titleList.map((title) {
                int index = titleList.indexOf(title);
                return TextButton(
                    style: const ButtonStyle(
                        shape: MaterialStatePropertyAll(CircleBorder())),
                    onPressed: () {
                      _controller.animateToPage(index,
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.decelerate);
                    },
                    child: Text((index + 1).toString()));
              }).toList()),
        ],
      ),
    );
  }
}

class ProjectView extends StatefulWidget {
  const ProjectView({super.key, required this.title});
  final String title;

  @override
  State<ProjectView> createState() => _ProjectViewState();
}

class _ProjectViewState extends State<ProjectView> {
  late final String title = widget.title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        String link = projects[title]!["link"]!;
        if (kIsWeb) {
          html.window.open(link, 'new tab');
        }
      },
      splashFactory: InkSparkle.splashFactory,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.white54),
        width: 350,
        height: 280,
        child: Column(
          children: [
            const SizedBox(height: 30),
            Row(
              children: [
                Text(
                  title,
                  style: GoogleFonts.orbitron(
                      textStyle: const TextStyle(fontSize: 28)),
                ),
                const Icon(Icons.open_in_new),
              ],
            ),
            const SizedBox(height: 30),
            Text(projects[title]!["description"]!),
          ],
        ),
      ),
    );
  }
}
