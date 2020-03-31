import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final String _text;
  final Color _buttonColor;
  final Color _textColor;
  final VoidCallback _onTap;
  final double minWidth;

  CustomButtonWidget(
      this._text, this._buttonColor, this._textColor, this._onTap,
      {this.minWidth});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
        height: 50,
        minWidth: minWidth != null ? minWidth : 0,
        child: RaisedButton(
            child: Text(this._text,
                style: TextStyle(
                  color: this._textColor, fontSize: 20)),
            color: this._buttonColor,
            onPressed: () => this._onTap()));
  }
}
