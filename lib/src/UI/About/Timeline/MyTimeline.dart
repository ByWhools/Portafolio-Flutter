import 'package:cached_network_image/cached_network_image.dart';
import 'package:portafolio/src/UI/About/Timeline/EventCard.dart';
import 'package:portafolio/src/provider/theme_dark.dart';
import 'package:portafolio/src/widgets/ResponsiveWidget.dart';
import 'package:provider/provider.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:flutter/material.dart';

class MyTimeLine extends StatelessWidget {
  const MyTimeLine({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.title,
    required this.trailing,
    required this.description,
    required this.urlProject,
  });
  final bool isFirst;
  final bool isLast;
  final String title;
  final String trailing;
  final String description;
  final String urlProject;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeDark>(context, listen: true);
    return SizedBox(
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        indicatorStyle: IndicatorStyle(
            color: themeProvider.WhiteforBlack,
            width: ResponsiveWidget.isSmallScreen(context) ? 10 : 20),
        beforeLineStyle: LineStyle(
          thickness: 1, color: themeProvider.Text),
        endChild: EventCard(
          title: title,
          trailing: trailing,
          description: description,
          urlProject: urlProject,
        ),
      ),
    );
  }
}
