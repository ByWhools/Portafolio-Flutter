import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:portafolio/src/provider/theme_dark.dart';
import 'package:portafolio/src/services/UrlLauncher.dart';
import 'package:portafolio/src/widgets/ResponsiveWidget.dart';
import 'package:provider/provider.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
    required this.title,
    required this.trailing,
    required this.description,
    required this.urlProject,
  });
  final String title;
  final String trailing;
  final String description;
  final String urlProject;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeDark>(context, listen: true);
    return Container(
      margin: EdgeInsets.only(
          bottom: ResponsiveWidget.isSmallScreen(context) ? 50 : 5),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
            horizontal: ResponsiveWidget.isSmallScreen(context) ? 1 : 10,
            vertical: ResponsiveWidget.isSmallScreen(context) ? 1 : 10),
        onTap: () {
          launchSocialNetwork(urlProject);
        },
        subtitle: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: GoogleFonts.roboto(
                  fontSize: ResponsiveWidget.isSmallScreen(context) ? 15 : 20,
                  color: themeProvider.WhiteforBlack,
                  fontWeight: FontWeight.bold),
            ),
            LineIcon.spotify(
              color: themeProvider.WhiteforBlack,
            )
          ],
        ),
      ),
    );
  }
}
