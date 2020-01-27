import 'package:flutter/material.dart';

class PlayerNameListItem extends StatelessWidget {
  final String _playerName;
  final VoidCallback _onTap;

  PlayerNameListItem(this._playerName, this._onTap);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(_playerName,
            style: Theme.of(context).textTheme.body1),
        IconButton(
            icon: Icon(Icons.clear),
            color: Theme.of(context).accentColor,
            iconSize: 20.0,
            onPressed: () => _onTap()),
      ],
    );
  }
}
