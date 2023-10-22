import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:portafolio/src/provider/theme_dark.dart';
import 'package:portafolio/src/widgets/ResponsiveWidget.dart';
import 'package:portafolio/src/widgets/hexcolor.dart';
import 'package:provider/provider.dart';

class ListitleFront extends StatefulWidget {
  const ListitleFront(
      {super.key,
      required this.isAbout,
      required this.isProjects,
      required this.isContactMe});
  final bool isAbout;
  final bool isProjects;
  final bool isContactMe;

  @override
  State<ListitleFront> createState() => _ListitleFrontState();
}

class _ListitleFrontState extends State<ListitleFront> {
  @override
  Widget build(BuildContext context) {
    final isAbout = widget.isAbout;
    final isProjects = widget.isProjects;
    final isContactMe = widget.isContactMe;

    final themeProvider = Provider.of<ThemeDark>(context, listen: true);
    return Column(
      children: [
        ResponsiveWidget.isSmallScreen(context)
            ? ListTile(
                leading: InkWell(
                  onTap: () => Navigator.pushNamed(context, "/"),
                  child: Text(
                    "YL",
                    style: GoogleFonts.silkscreen(
                        color: themeProvider.WhiteforBlack),
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Builder(
                      builder: (BuildContext context) {
                        return IconButton(
                            tooltip: "How to sell D*** Online Fast?",
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                            icon: Icon(
                              FontAwesomeIcons.list,
                              color: themeProvider.WhiteforBlack,
                              size: 20,
                            ));
                      },
                    ),
                  ],
                ))
            : ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 2, vertical: 50),
                leading: InkWell(
                  onTap: () => Navigator.pushNamed(context, "/"),
                  child: Text(
                    "YL",
                    style: GoogleFonts.silkscreen(
                        fontSize: 30, color: themeProvider.WhiteforBlack),
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (isAbout == true)
                      TextButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, "/AboutMe"),
                          child: Text("About",
                              style: GoogleFonts.silkscreen(
                                  color: themeProvider.WhiteforBlack))),
                    if (isProjects == true)
                      TextButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, '/Projects'),
                          child: Text("Projects",
                              style: GoogleFonts.silkscreen(
                                  color: themeProvider.WhiteforBlack))),
                    FlutterSwitch(
                      width: 60,
                      height: 30,
                      value: themeProvider.isDark,
                      onToggle: (value) {
                        setState(() {
                          themeProvider.toggleMode(value);
                        });
                      },
                      activeColor: Colors.white,
                      inactiveColor: HexColor("1e1e1e"),
                      inactiveToggleColor: Colors.white,
                      inactiveIcon: LineIcon.sun(
                        color: themeProvider.WhiteforBlack,
                      ),
                      activeToggleColor: Colors.black,
                      activeIcon: LineIcon.moon(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}
