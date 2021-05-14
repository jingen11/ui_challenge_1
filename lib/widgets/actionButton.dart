import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';

import '../const/color.dart';

class ActionButton extends StatelessWidget {
  final String tag;
  final bool _isBuy;

  ActionButton(this.tag, this._isBuy);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: 140,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 3),
                blurRadius: 3,
                spreadRadius: 0,
                color: BOXSHADOWCOLOR),
            BoxShadow(
                offset: Offset.zero,
                blurRadius: 0,
                spreadRadius: 0,
                color: Colors.white)
          ]),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 44,
              width: 44,
              decoration: ShapeDecoration(
                shape: CircleBorder(),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: _isBuy ? [XRPLIGHT, XRPDARK] : [PINKLIGHT, PINKDARK],
                ),
              ),
              child: Icon(FontAwesome.dollar),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              _isBuy ? 'Buy $tag' : 'Sell $tag',
              style: Theme.of(context).textTheme.headline5,
            )
          ],
        ),
      ),
    );
  }
}
