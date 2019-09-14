import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String _text;
  final double _height;
  final bool _backVisible;

  CustomAppBar(this._text, this._height, this._backVisible);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(null, 100),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        child: Container(
          color: Colors.red,
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Visibility(
                    visible: this._backVisible,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                            icon: Icon(Icons.arrow_back_ios),
                            tooltip: 'Back',
                            color: Colors.white,
                            onPressed: () => Navigator.of(context).pop()))),
                Text(
                  this._text,
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(this._height);
}
