import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slicing_healthy_pet/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => HomeScreen()),
          (route) => false);
    });

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.cover)),
          ),
          Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 42,
                ),
                SvgPicture.asset(
                  'assets/svgs/logo.svg',
                  height: 22,
                  fit: BoxFit.scaleDown,
                ),
                const SizedBox(
                  height: 70,
                ),
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: 'Helping you\nto keep ',
                        style: GoogleFonts.manrope(
                            fontSize: 24,
                            color: const Color(0xffDEE1FE),
                            letterSpacing: 3.5 / 100,
                            height: 152 / 100),
                        children: const [
                          TextSpan(
                              text: 'your bestie',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800)),
                          TextSpan(text: '\nstay healthy!')
                        ]))
              ],
            ),
          )
        ],
      ),
    );
  }
}
