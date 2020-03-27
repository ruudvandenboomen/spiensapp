import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:toep_app/pages/settings_page.dart';

class SettingsAppBar extends AppBar {
  SettingsAppBar(_text, _context, _leadingButton)
      : super(
            title: Text(_text,
                style: TextStyle(
                  fontSize: 30,
                )),
            centerTitle: true,
            leading: _leadingButton
                ? IconButton(
                    icon: new Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () => Navigator.of(_context).pop())
                : null,
            actions: [
              IconButton(
                  icon: new Icon(Icons.settings, color: Colors.white),
                  onPressed: () => Navigator.of(_context).push(
                      CupertinoPageRoute(
                          builder: (BuildContext context) => SettingsPage())))
            ]);
}
