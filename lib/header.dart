import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        Image.asset(
          "avatar.png",
          width: 200,
          height: 200,
        ),
        Text('Judy Dev',
            style:
                GoogleFonts.orbitron(textStyle: const TextStyle(fontSize: 48))),
        const SizedBox(height: 30)
      ],
    );
  }
}

class MySummary extends StatelessWidget {
  const MySummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: SizedBox(
        width: 800,
        child: Text(
          'After being a web developer for 5 years, I quit my job and took some time to explore what I wanted to do next. I started using Flutter to build cross-platform (mostly iOS) apps. I also picked up Python for functional programming and machine learning. In my free time, I love listening to music and traveling. I also started writing songs last year.',
          style: GoogleFonts.changa(
              textStyle:
                  const TextStyle(fontSize: 24, fontWeight: FontWeight.w300)),
        ),
      ),
    );
  }
}
