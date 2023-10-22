import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:portafolio/src/UI/Home/Me.dart';
import 'package:portafolio/src/provider/theme_dark.dart';
import 'package:portafolio/src/reusables/DrawerMobile.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Offset offset = const Offset(0, 0);
  @override
  Widget build(BuildContext context) {
    final widht = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final themeProvider = Provider.of<ThemeDark>(context, listen: true);
    return Scaffold(
      backgroundColor: themeProvider.blackforWhite,
      body: FadeInDown(
        duration: Duration(milliseconds: 1200),
        child: SingleChildScrollView(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 1200),
            color: themeProvider.blackforWhite,
            child:const  Stack(
              children: [
                Column(
                  children: [
                    Me(),
                     SizedBox(
                      height: 20,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      drawer: const DrawerMobile(
        isAbout: true,
        isContactMe: true,
        isProjects: true,
      ),
    );
  }
}
