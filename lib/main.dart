import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toep_app/ui/themes/themes.dart';
import 'package:toep_app/util/prefs.dart';
import 'package:toep_app/util/theme_changer.dart';
import './pages/players_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {
  SharedPreferences sharedPreferences;
  ThemeChanger themeChanger = ThemeChanger(ThemeMode.system);

  void loadThemeMode() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String themeModeString = sharedPreferences.getString(Prefs.THEME_PREF);

    if (themeModeString == null) {
      themeChanger.setThemeMode(ThemeMode.system);
    } else {
      themeChanger
          .setThemeMode(Prefs.singleton().stringToThemeMode(themeModeString));
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadThemeMode();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      builder: (_) => themeChanger,
      child: MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _themeChanger = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      title: 'Spiens App',
      debugShowCheckedModeBanner: false,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      home: PlayersPage(),
      themeMode: _themeChanger.getThemeMode(),
    );
  }
}
