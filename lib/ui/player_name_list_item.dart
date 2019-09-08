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
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
            )),
        IconButton(
            icon: Icon(Icons.clear),
            color: Colors.red,
            iconSize: 20.0,
            onPressed: () => _onTap()),
      ],
    );
  }
}
