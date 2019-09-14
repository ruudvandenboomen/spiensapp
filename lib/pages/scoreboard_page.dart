import 'package:flutter/material.dart';
import 'package:toep_app/objects/duizenden.dart';
import 'package:toep_app/objects/toepen.dart';
import 'package:toep_app/pages/duizenden_page.dart';
import 'package:toep_app/pages/toepen_page.dart';
import 'package:toep_app/ui/custom_button.dart';

import '../objects/player.dart';
import 'package:flutter/cupertino.dart';

class ScoreBoardPage extends StatefulWidget {
  ScoreBoardPage();

  @override
  State<StatefulWidget> createState() => ScoreBoardPageState();
}

class ScoreBoardPageState extends State<ScoreBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container());
  }
}
