import 'package:flutter/material.dart';
import 'package:toep_app/animations/item_effect.dart';
import 'package:toep_app/animations/listbloc.dart';

class ListViewEffect extends StatefulWidget {
  final Duration duration;
  final List<Widget> children;

  ListViewEffect({Key key, this.duration, this.children}) : super(key: key);
  _ListViewEffect createState() => _ListViewEffect();
}

class _ListViewEffect extends State<ListViewEffect> {
  ListBloc _listBloc;

  initState() {
    _listBloc = ListBloc();
    super.initState();
  }

  Widget build(BuildContext context) {
    _listBloc.startAnimation(widget.children.length, widget.duration);

    return Container(
        height: ((widget.children.length * 60)).toDouble(),
        child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            addAutomaticKeepAlives: true,
            itemCount: widget.children.length,
            itemBuilder: (context, position) {
              return ItemEffect(
                  child: widget.children[position],
                  duration: widget.duration,
                  position: position);
            }));
  }

  @override
  void dispose() {
    _listBloc.dispose();
    super.dispose();
  }
}
