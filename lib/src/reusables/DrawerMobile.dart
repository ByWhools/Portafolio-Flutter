import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:portafolio/src/provider/theme_dark.dart';
import 'package:provider/provider.dart';

class DrawerMobile extends StatelessWidget {
  const DrawerMobile(
      {super.key,
      required this.isAbout,
      required this.isContactMe,
      required this.isProjects});

  final bool isProjects;
  final bool isAbout;
  final bool isContactMe;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeDark>(context, listen: true);
    return Drawer(
      backgroundColor: themeProvider.blackforWhite,
      child: ListView(
        children: [
          ListTile(
            leading: Icon(LineIcons.arrowLeft, color: themeProvider.WhiteforBlack,),
            onTap: () => Navigator.pop(context),
          ),
          if (isAbout == true)
            ListTile(
              leading: Text(
                "About me",
                style: GoogleFonts.silkscreen(
                  color: themeProvider.WhiteforBlack,
                ),
              ),
              trailing: Icon(
                LineIcons.user,
                color: themeProvider.WhiteforBlack,
              ),
              onTap: () => Navigator.pushNamed(context, "/AboutMe"),
            ),
          if (isProjects == true)
            ListTile(
              leading: Text(
                "Projects",
                style: GoogleFonts.silkscreen(
                  color: themeProvider.WhiteforBlack,
                ),
              ),
              trailing: Icon(
                LineIcons.book,
                color: themeProvider.WhiteforBlack,
              ),
              onTap: () => Navigator.pushNamed(context, "/Projects"),
            ),
        ],
      ),
    );
  }
}
