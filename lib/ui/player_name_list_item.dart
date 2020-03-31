import 'package:flutter/material.dart';

class PlayerNameListItem extends StatelessWidget {
  final String _playerName;
  final VoidCallback _onTap;

  PlayerNameListItem(this._playerName, this._onTap);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
            height: 50,
            alignment: Alignment.center,
            child: Text(_playerName,
                style: Theme.of(context).textTheme.bodyText1)),
        Align(
            alignment: Alignment.centerRight,
            child: IconButton(
                icon: Icon(Icons.clear),
                color: Theme.of(context).accentColor,
                iconSize: 20.0,
                onPressed: () => _onTap())),
      ],
    );
  }
}
