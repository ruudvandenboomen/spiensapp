import 'package:flutter/material.dart';
import 'package:toep_app/ui/appbar/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:toep_app/util/prefs.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage>
    with WidgetsBindingObserver {
  String dropdownValue = Prefs.singleton().getThemeString();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    final Brightness brightness =
        WidgetsBinding.instance.window.platformBrightness;
    //inform listeners and rebuild widget tree
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: CustomAppBar("Instellingen", context, true),
        body: Card(
            margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.all(20),
                      child: Text("Thema",
                          style: Theme.of(context).textTheme.bodyText1)),
                  DropdownButton<String>(
                    value: dropdownValue,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                        Prefs.singleton().setTheme(newValue, context);
                      });
                    },
                    items: Prefs.themes.values
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )
                ])));
  }
}
