import 'package:flutter/material.dart';
import 'package:toep_app/util/is_dark.dart';

class AddPlayerWidget extends StatelessWidget {
  final TextEditingController _textEditingController;
  final VoidCallback _addPlayer;
  final Function _playerValidCheck;
  static final _formKey = GlobalKey<FormState>();

  AddPlayerWidget(
      this._textEditingController, this._addPlayer, this._playerValidCheck);

  void checkForm() {
    if (_formKey.currentState.validate()) {
      this._addPlayer();
    }
  }

  @override
  Widget build(BuildContext context) {
    var suitedColor = DarkMode(context).isEnabled ? Colors.white : Colors.black;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
            child: Form(
                key: _formKey,
                child: Container(
                    padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        return this._playerValidCheck();
                      },
                      onEditingComplete: () => this.checkForm(),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        errorStyle: TextStyle(color: Colors.red, fontSize: 16),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide:
                                BorderSide(color: Colors.redAccent, width: 2)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide:
                                BorderSide(color: suitedColor, width: 1)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide:
                                BorderSide(color: suitedColor, width: 2)),
                        contentPadding: EdgeInsets.fromLTRB(62, 12, 12, 12),
                        hintMaxLines: 1,
                        hintText: 'Spelernaam',
                        hintStyle: TextStyle(
                            color: DarkMode(context).isEnabled
                                ? Colors.white70
                                : Colors.black54),
                        suffixIcon: ButtonTheme(
                            height: 50,
                            minWidth: 50,
                            child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                child: Icon(Icons.add, color: suitedColor),
                                color: Colors.transparent,
                                elevation: 0,
                                onPressed: () => this.checkForm())),
                      ),
                      controller: _textEditingController,
                      textCapitalization: TextCapitalization.words,
                      style: Theme.of(context).textTheme.bodyText1,
                    )))),
      ],
    );
  }
}
