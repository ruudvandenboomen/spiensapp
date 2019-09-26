import 'package:flutter/material.dart';

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
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'Speler Naam',
                        suffixIcon: ButtonTheme(
                            height: 50,
                            minWidth: 100,
                            child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                child: Icon(Icons.add, color: Colors.white),
                                color: Colors.red,
                                onPressed: () => this._onTap)),
                        border: InputBorder.none,
                      ),
                      onTap: this._onTap,
                      controller: _textEditingController,
                      textCapitalization: TextCapitalization.words,
                      style: TextStyle(fontSize: 20.0, color: Colors.black),
                    )))),
      ],
    );
  }
}
