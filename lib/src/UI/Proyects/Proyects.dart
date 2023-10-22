import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:portafolio/src/UI/Home/Home.dart';
import 'package:portafolio/src/UI/Proyects/Projectwidget.dart';
import 'package:portafolio/src/models/Projectmodel.dart';
import 'package:portafolio/src/provider/theme_dark.dart';
import 'package:portafolio/src/reusables/DrawerMobile.dart';
import 'package:portafolio/src/reusables/LIstTitle.dart';
import 'package:portafolio/src/services/urlLauncher.dart';
import 'package:portafolio/src/widgets/IconWidget.dart';
import 'package:portafolio/src/widgets/ResponsiveWidget.dart';
import 'package:portafolio/src/widgets/hexcolor.dart';
import 'package:provider/provider.dart';

class Proyects extends StatefulWidget {
  const Proyects({super.key});

  @override
  State<Proyects> createState() => _ProyectsState();
}

class _ProyectsState extends State<Proyects> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isHovered = false;
  String selectedProjectImageUrl = "";
  String title = "";
  String description = "";
  String largerDescription = "";
  String urlWeb = "";
  String github = "";

  @override
  Widget build(BuildContext context) {
    final widht = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final themeProvider = Provider.of<ThemeDark>(context, listen: true);
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: themeProvider.blackforWhite,
        body: SingleChildScrollView(
          child: FadeInUp(
            duration: const Duration(milliseconds: 1200),
            child: Padding(
              padding: EdgeInsets.only(
                  top: height * 0.05, left: widht / 15, right: widht / 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ListitleFront(
                    isAbout: true,
                    isContactMe: true,
                    isProjects: false,
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
                          "Projects",
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
                        GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                ResponsiveWidget.isSmallScreen(context) ? 1 : 3,
                          ),
                          itemCount: projects.length,
                          itemBuilder: (context, index) {
                            final project = projects[index];

                            return Column(
                              children: [
                                ProjectCard(
                                    title: project.title,
                                    description: project.description,
                                    imageUrl: project.imageUrl,
                                    onTap: () {
                                      setState(() {
                                        selectedProjectImageUrl =
                                            project.imageUrl;
                                        description = project.description;
                                        title = project.title;
                                        urlWeb = project.urlProject;
                                        largerDescription =
                                            project.largerDescription;
                                        github = project.github;
                                      });
                                      _scaffoldKey.currentState!
                                          .openEndDrawer();
                                    }),
                              ],
                            );
                          },
                        ),
                        const SizedBox(
                          height: 30,
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
                  )
                ],
              ),
            ),
          ),
        ),
        endDrawer: Drawer(
          width: ResponsiveWidget.isSmallScreen(context) ? null : 600,
          backgroundColor: themeProvider.blackforWhite,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ListView(
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 1),
                  leading: Icon(
                    LineIcons.arrowLeft,
                    color: themeProvider.WhiteforBlack,
                  ),
                  onTap: () => Navigator.pop(context),
                ),
                Text(
                  title,
                  style: TextStyle(
                      color: themeProvider.WhiteforBlack,
                      fontWeight: FontWeight.bold,
                      fontSize:
                          ResponsiveWidget.isSmallScreen(context) ? 15 : 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  description,
                  style: GoogleFonts.openSans(
                    color: themeProvider.WhiteforBlack,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  width: ResponsiveWidget.isSmallScreen(context)
                      ? double.infinity
                      : 400,
                  height: ResponsiveWidget.isSmallScreen(context) ? 150.0 : 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(selectedProjectImageUrl))),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "About",
                  style: GoogleFonts.silkscreen(
                      color: themeProvider.WhiteforBlack,
                      fontSize:
                          ResponsiveWidget.isSmallScreen(context) ? 15 : 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  largerDescription,
                  style: GoogleFonts.openSans(
                    color: themeProvider.WhiteforBlack,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                if (urlWeb.isNotEmpty)
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.earth,
                        color: themeProvider.WhiteforBlack,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text("Website",
                          style: GoogleFonts.silkscreen(
                              color: themeProvider.WhiteforBlack,
                              fontSize: ResponsiveWidget.isSmallScreen(context)
                                  ? 15
                                  : 20))
                    ],
                  ),
                const SizedBox(
                  height: 10,
                ),
                if (urlWeb.isNotEmpty)
                  TextButton(
                      onPressed: () {
                        launchSocialNetwork(urlWeb);
                      },
                      child: Text(
                        urlWeb,
                        textAlign: TextAlign.left,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.blueAccent),
                      )),
                const SizedBox(
                  height: 10,
                ),
                if (github.isNotEmpty)
                  Row(
                    children: [
                      Icon(
                        LineIcons.github,
                        color: themeProvider.WhiteforBlack,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text("Github",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.silkscreen(
                              color: themeProvider.WhiteforBlack,
                              fontSize: ResponsiveWidget.isSmallScreen(context)
                                  ? 15
                                  : 20))
                    ],
                  ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    launchSocialNetwork(github);
                  },
                  child: Text(github,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Colors.blueAccent,
                      )),
                )
              ],
            ),
          ),
        ),
        drawer: const DrawerMobile(
            isAbout: true, isContactMe: true, isProjects: false));
  }
}
