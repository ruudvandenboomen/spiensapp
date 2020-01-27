import 'package:flutter/material.dart';
import 'package:toep_app/util/is_dark.dart';

class AddPlayerWidget extends StatelessWidget {
  final TextEditingController _textEditingController;
  final VoidCallback _onTap;

  AddPlayerWidget(this._textEditingController, this._onTap);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
            child: Container(
                padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: DarkMode(context).isEnabled
                                ? Colors.white
                                : Colors.black,
                            width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: TextField(
                      onEditingComplete: () => this._onTap(),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'Speler Naam',
                        hintStyle: TextStyle(color: Colors.white70),
                        suffixIcon: ButtonTheme(
                            height: 50,
                            minWidth: 100,
                            child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                child: Icon(Icons.add, color: Colors.white),
                                color: Theme.of(context).accentColor,
                                onPressed: () => this._onTap())),
                        border: InputBorder.none,
                      ),
                      controller: _textEditingController,
                      textCapitalization: TextCapitalization.words,
                      style: Theme.of(context).textTheme.body1,
                    )))),
      ],
    );
  }
}
