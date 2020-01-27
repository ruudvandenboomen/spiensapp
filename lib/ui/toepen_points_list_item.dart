import 'package:flutter/material.dart';
import 'package:toep_app/util/is_dark.dart';
import '../objects/player.dart';

class ToepenPointsListItem extends StatelessWidget {
  static const _kFontFam = 'MyFlutterApp';

  final Player _player;
  final void Function(Player, int) _updateScore;
  ToepenPointsListItem(this._player, this._updateScore);

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      GestureDetector(
          child: Container(
              width: 120.0,
              padding: EdgeInsets.all(13.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Text(_player.getName(),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.body1))
                ],
              ),
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                      width: 2.0,
                      color: DarkMode(context).isEnabled ? Colors.white : Colors.black),
                ),
              ))),
      Container(
          width: 60.0,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _player.getScore() >= 9
                  ? Theme.of(context).accentColor
                  : Colors.transparent),
          child: Text(_player.getScore().toString(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.body1)),
      Flexible(
          flex: 2,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            IconButton(
                icon: Icon(IconData(0xe800, fontFamily: _kFontFam)),
                color: Theme.of(context).accentColor,
                iconSize: 20.0,
                onPressed: () => (_updateScore(_player, -1))),
            IconButton(
                icon: Icon(IconData(0xe801, fontFamily: _kFontFam)),
                color: Theme.of(context).accentColor,
                iconSize: 20.0,
                onPressed: () => (_updateScore(_player, 1)))
          ]))
    ]);
  }
}
