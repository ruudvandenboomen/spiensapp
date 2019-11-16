import 'package:flutter/material.dart';

class ScoreBoardGameSelector extends StatelessWidget {
  final Color _color;
  final String _text;
  final Function(String) _onTap;

  ScoreBoardGameSelector(this._color, this._text, this._onTap);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
            decoration: BoxDecoration(
                color: this._color,
                borderRadius: BorderRadius.all(Radius.circular(50))),
            padding: EdgeInsets.all(10),
            child: GestureDetector(
                onTap: () => this._onTap(this._text),
                child: Text(this._text,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 20.0)))));
  }
}
