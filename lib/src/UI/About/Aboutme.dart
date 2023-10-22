import 'package:animate_do/animate_do.dart';
import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/themes/agate.dart';
import 'package:flutter_highlight/themes/atom-one-dark-reasonable.dart';
import 'package:flutter_highlight/themes/darcula.dart';
import 'package:flutter_highlight/themes/dark.dart';
import 'package:flutter_highlight/themes/github-gist.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:flutter_highlight/themes/magula.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:highlight/languages/dart.dart';
import 'package:line_icons/line_icons.dart';
import 'package:portafolio/src/UI/About/Timeline/MyTimeline.dart';
import 'package:portafolio/src/provider/theme_dark.dart';
import 'package:portafolio/src/reusables/DrawerMobile.dart';
import 'package:portafolio/src/reusables/LIstTitle.dart';
import 'package:portafolio/src/services/urlLauncher.dart';
import 'package:portafolio/src/utils/Strings.dart';
import 'package:portafolio/src/widgets/IconWidget.dart';
import 'package:portafolio/src/widgets/ResponsiveWidget.dart';
import 'package:provider/provider.dart';

class Aboutme extends StatefulWidget {
  const Aboutme({super.key});

  @override
  State<Aboutme> createState() => _AboutmeState();
}

class _AboutmeState extends State<Aboutme> {
  CodeController? _codeController;

  @override
  void initState() {
    super.initState();
    // Instantiate the CodeController
    _codeController = CodeController(
      text: code,
      language: dart,
    );
  }

  @override
  void dispose() {
    _codeController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final widht = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final themeProvider = Provider.of<ThemeDark>(context, listen: true);
    return Scaffold(
      backgroundColor: themeProvider.blackforWhite,
      body: SingleChildScrollView(
        child: FadeInLeft(
          duration: const Duration(milliseconds: 500),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 1200),
            color: themeProvider.blackforWhite,
            child: Padding(
              padding: EdgeInsets.only(
                  top: height * 0.05, left: widht / 15, right: widht / 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ListitleFront(
                    isAbout: false,
                    isContactMe: true,
                    isProjects: true,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            ResponsiveWidget.isSmallScreen(context) ? 20 : 50,
                        vertical:
                            ResponsiveWidget.isSmallScreen(context) ? 20 : 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "About Me.",
                          style: GoogleFonts.roboto(
                              color: themeProvider.WhiteforBlack,
                              fontWeight: FontWeight.bold,
                              fontSize: ResponsiveWidget.isSmallScreen(context)
                                  ? 20
                                  : 40),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SingleChildScrollView(
                          physics: const NeverScrollableScrollPhysics(),
                          child: CodeTheme(
                            data:
                                CodeThemeData(styles: atomOneDarkReasonableTheme),
                            child: CodeField(
                              enabled: true,
                              readOnly: true,
                              isDense:  true,
                              controller: _codeController!,
                              textStyle:
                                  const TextStyle(fontFamily: 'SourceCode'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "My Playlist.",
                          style: GoogleFonts.roboto(
                              color: themeProvider.WhiteforBlack,
                              fontWeight: FontWeight.bold,
                              fontSize: ResponsiveWidget.isSmallScreen(context)
                                  ? 20
                                  : 40),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          descriptionPlaylist,
                          maxLines: 4,
                          style: GoogleFonts.openSans(
                              color: themeProvider.WhiteforBlack,
                              fontSize: ResponsiveWidget.isSmallScreen(context)
                                  ? 15
                                  : 15),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          child: const HtmlWidget(
                            '''
          <iframe style="border-radius:12px" src="https://open.spotify.com/embed/playlist/6Sm6jmot3EOnB5xXgGDzNR?utm_source=generator&theme=0" width="50%" height="50%" frameBorder="0" allowfullscreen="" allow="autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture" loading="lazy"></iframe>
          
            ''',
                          ),
                        ),
                        SizedBox(
                          width: widht,
                          height: 100,
                          child: const HtmlWidget(
                            '''
          <iframe  width=50 " height="352"style="border-radius:12px" src="https://open.spotify.com/embed/playlist/5qpIdWbSzlBw6TU0MbwnBH?utm_source=generator"  frameBorder="0" allowfullscreen="" allow="autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture" loading="lazy"></iframe>
          
            ''',
                          ),
                        ),
                        SizedBox(
                          width: widht,
                          height: 100,
                          child: const HtmlWidget(
                            '''
        <iframe style="border-radius:12px" src="https://open.spotify.com/embed/playlist/1nOmelFaJxCWUEm79Jvtc0?utm_source=generator" width="50" height="152" frameBorder="0" allowfullscreen="" allow="autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture" loading="lazy"></iframe>
          
            ''',
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  launchSocialNetwork(
                                      "https://www.instagram.com/young_alely/");
                                },
                                icon: const IconsDrawer(
                                    icon: LineIcons.instagram,
                                    color: Colors.black)),
                            IconButton(
                                onPressed: () {
                                  launchSocialNetwork(
                                      "https://github.com/youngalely");
                                },
                                icon: const IconsDrawer(
                                    icon: LineIcons.github,
                                    color: Colors.black)),
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      drawer: const DrawerMobile(
        isAbout: false,
        isContactMe: false,
        isProjects: true,
      ),
    );
  }
}
