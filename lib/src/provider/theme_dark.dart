import 'package:flutter/material.dart';
import 'package:portafolio/src/widgets/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ThemeDark extends ChangeNotifier{

  bool _isDark = false;
  bool get isDark => _isDark;

  void toggleMode(bool newmode)async{
    _isDark = newmode;
    notifyListeners();  
    final preferences = await SharedPreferences.getInstance();
    await preferences.setBool('theme_mode', _isDark);
}
   Future<void> loadThemeMode()async{
    final preferences = await SharedPreferences.getInstance();
    _isDark = preferences.getBool('theme_mode') ?? true;
    notifyListeners();
   }

   Color get blackforWhite{
    return isDark ? Colors.black: HexColor("f8f9fa");
   }

    Color get WhiteforBlack{
    return isDark  ? Colors.white: HexColor("000000") ;
   }

   Color get Text{
    return isDark ? HexColor("d6d6d6") :HexColor("9e9e9c");
   }
   Color get drawer{
    return isDark ? HexColor("e9ecef") : Colors.black;
   }
   
}