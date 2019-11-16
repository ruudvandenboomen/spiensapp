import 'package:flutter/material.dart';
import 'package:toep_app/objects/duizenden.dart';
import 'package:toep_app/objects/toepen.dart';
import 'package:toep_app/pages/duizenden_page.dart';
import 'package:toep_app/pages/toepen_page.dart';
import 'package:toep_app/ui/custom_appbar.dart';
import 'package:toep_app/ui/custom_button.dart';
import '../objects/player.dart';
import 'package:flutter/cupertino.dart';

class GamePage extends StatefulWidget {
  final List<Player> _players;
  final DuizendenPage duizendenPage;
  final double _buttonWidth = 250;
  final double _toolbarHeight = 100;
  final double _buttonAndPaddingHeight = 110;

  GamePage(this._players)
      : this.duizendenPage = DuizendenPage(Duizenden(_players));

  @override
  State<StatefulWidget> createState() => GamePageState();
}

class GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: CustomAppBar("Kaartspel", context, true),
        body: Container(
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.red),
            child: Stack(children: <Widget>[
              Positioned(
                  top: ((MediaQuery.of(context).size.height -
                          widget._toolbarHeight -
                          widget._buttonAndPaddingHeight) /
                      2),
                  left: (MediaQuery.of(context).size.width -
                          widget._buttonWidth) /
                      2,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: CustomButtonWidget(
                              "Toepen",
                              Colors.white,
                              Colors.red,
                              () => Navigator.of(context).push(
                                  CupertinoPageRoute(
                                      builder: (BuildContext context) =>
                                          ToepenPage(
                                              Toepen(this.widget._players)))),
                              minWidth: widget._buttonWidth,
                            )),
                        CustomButtonWidget(
                            "Duizenden",
                            Colors.white,
                            Colors.red,
                            () => Navigator.of(context).push(CupertinoPageRoute(
                                builder: (BuildContext context) =>
                                    widget.duizendenPage)),
                            minWidth: 250),
                      ]))
            ])));
  }
}
