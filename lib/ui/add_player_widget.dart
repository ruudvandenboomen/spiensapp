import 'package:flutter/material.dart';
import 'package:toep_app/ui/custom_button.dart';

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
                        suffixIcon: CustomButtonWidget("+", Colors.red,
                            Colors.white, this._onTap, minWidth: 100),
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
