import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:portafolio/src/provider/theme_dark.dart';
import 'package:portafolio/src/widgets/ResponsiveWidget.dart';
import 'package:provider/provider.dart';

class ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final String imageUrl;
  final Function onTap;

  const ProjectCard({
    Key? key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.onTap,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeDark>(context, listen: true);

    return InkWell(
      onTap: () {
        widget.onTap();
      },
      onHover: (hover) {
        setState(() {
          isHovered = hover;
        });
      },
      child: Card(
        color: themeProvider.blackforWhite,
        elevation: isHovered ? 6.0 : 3.0,
        margin: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: ShaderMask(
                shaderCallback: (rect) => isHovered
                    ? const LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.center,
                        colors: [Colors.black, Colors.transparent],
                      ).createShader(rect)
                    : const LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.center,
                        colors: [Colors.transparent, Colors.transparent],
                      ).createShader(rect),
                blendMode: BlendMode.darken,
                child: Container(
                  alignment: Alignment.center,
                  width: ResponsiveWidget.isSmallScreen(context)
                      ? double.infinity
                      : 400,
                  height: ResponsiveWidget.isSmallScreen(context) ? 200 : 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.imageUrl),
                      colorFilter: const ColorFilter.mode(
                        Color.fromARGB(137, 63, 63, 63),
                        BlendMode.darken,
                      ),
                    ),
                  ),
                  child: ResponsiveWidget.isSmallScreen(context)
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                widget.title,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                widget.description,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        )
                      : FadeInUp(
                          animate: true,
                          duration: const Duration(milliseconds: 1200),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if (isHovered) ...{
                                if (isHovered)
                                  FadeInUp(
                                    duration: const Duration(
                                        milliseconds:
                                            300), // Duración de la animación
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        widget.title,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                if (isHovered)
                                  FadeInUp(
                                    duration: const Duration(
                                        milliseconds:
                                            300), // Duración de la animación
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        widget.description,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                              } else ...{
                                const SizedBox()
                              }
                            ],
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
