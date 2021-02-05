import 'package:flutter/material.dart';
import 'package:toep_app/util/is_dark.dart';
import '../objects/player.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
              padding: EdgeInsets.fromLTRB(33, 13, 13, 13),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Text(_player.name,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.bodyText1))
                ],
              ),
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                      width: 2.0,
                      color: DarkMode(context).isEnabled
                          ? Colors.white
                          : Colors.black),
                ),
              ))),
      Container(
        width: 60.0,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _player.toepenScore == 9
                ? Theme.of(context).accentColor
                : Colors.transparent),
        child: _player.toepenScore <= 9
            ? Text(_player.toepenScore.toString(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1)
            : Align(
                alignment: Alignment.center,
                child: FaIcon(FontAwesomeIcons.dizzy,
                    color: Theme.of(context).accentColor)),
      ),
      Flexible(
          flex: 2,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            IconButton(
                icon: Icon(const IconData(0xe800, fontFamily: _kFontFam)),
                color: Theme.of(context).accentColor,
                iconSize: 20.0,
                onPressed: () => (_updateScore(_player, -1))),
            Container(
                padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: IconButton(
                    icon: Icon(const IconData(0xe801, fontFamily: _kFontFam)),
                    color: Theme.of(context).accentColor,
                    iconSize: 20.0,
                    onPressed: () => (_updateScore(_player, 1))))
          ]))
    ]);
  }
}
