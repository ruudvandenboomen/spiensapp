import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomAppBar extends AppBar {
  CustomAppBar(_text, _context, _leadingButton)
      : super(
            elevation: 0.0,
            title: Text(_text,
                style: TextStyle(
                  fontSize: 30,
                )),
            centerTitle: true,
            leading: _leadingButton
                ? IconButton(
                    icon: new Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () => Navigator.of(_context).pop())
                : null);
}
