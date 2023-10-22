import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:portafolio/src/provider/theme_dark.dart';
import 'package:portafolio/src/services/urlLauncher.dart';
import 'package:portafolio/src/widgets/IconWidget.dart';
import 'package:portafolio/src/reusables/LIstTitle.dart';
import 'package:provider/provider.dart';

import '../../widgets/ResponsiveWidget.dart';

class Me extends StatefulWidget {
  const Me({super.key});

  @override
  State<Me> createState() => _MeState();
}

class _MeState extends State<Me> {
  @override
  Widget build(BuildContext context) {
    final widht = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final themeProvider = Provider.of<ThemeDark>(context, listen: true);
    return Container(
      width: widht,
      height: ResponsiveWidget.isSmallScreen(context) ? 900 : 900,
      child: Padding(
        padding: EdgeInsets.only(left: widht / 15, right: widht / 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ListitleFront(
              isAbout: true,
              isContactMe: true,
              isProjects: true,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal:
                      ResponsiveWidget.isSmallScreen(context) ? 10 : 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "I´m Alejandro",
                    style: GoogleFonts.roboto(
                        fontSize:
                            ResponsiveWidget.isSmallScreen(context) ? 25 : 40,
                        fontWeight: FontWeight.bold,
                        color: themeProvider.WhiteforBlack),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RichText(
                    maxLines: 50,
                    text: TextSpan(children: [
                      TextSpan(
                          style: GoogleFonts.roboto(
                              color: themeProvider.Text, fontSize: 18),
                          text:
                              "Hi there! I'm your friendly neighborhood Full-Stack Developer, Flutter Developer, and UI Designer.\n\n\n"),
                      TextSpan(
                          style: GoogleFonts.roboto(
                              color: themeProvider.Text, fontSize: 18),
                          text:
                              "I dedicate my days (and often my nights) to crafting projects and transforming numerous lines of code into captivating, interactive experiences.\nAs the mastermind behind the Whools website, I continuously tread the path of innovation while embracing the principles of minimalism, always seeking beauty and simplicity. When I'm not immersed in code, you can find me grooving to the beats of house music, particularly Deep House. Feel free to get in touch with me anytime!"),
                    ]),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, '/Projects'),
                    child: DefaultTextStyle(
                        style: GoogleFonts.silkscreen(
                            color: themeProvider.WhiteforBlack),
                        child: InkWell(
                          onTap: () =>
                              Navigator.pushNamed(context, '/Projects'),
                          child: AnimatedTextKit(
                              repeatForever: true,
                              animatedTexts: [
                                TyperAnimatedText("See More About Me 👉")
                              ]),
                        )),
                  ),
                  const SizedBox(
                    height: 29,
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            launchSocialNetwork(
                                "https://www.instagram.com/young_alely/");
                          },
                          icon: const IconsDrawer(
                              icon: LineIcons.instagram, color: Colors.black)),
                      IconButton(
                          onPressed: () {
                            launchSocialNetwork(
                                "https://github.com/youngalely");
                          },
                          icon: const IconsDrawer(
                              icon: LineIcons.github, color: Colors.black)),
                      IconButton(
                          onPressed: () {
                            launchSocialNetwork(
                                "https://www.tiktok.com/@young_lely");
                          },
                          icon: const IconsDrawer(
                              icon: FontAwesomeIcons.tiktok,
                              color: Colors.black)),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
