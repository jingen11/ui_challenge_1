import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';

import '../models/currency.dart';
import '../const/color.dart';

class CurrencyCard extends StatelessWidget {
  final Currency _currency;
  CurrencyCard(this._currency);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 3),
            blurRadius: 3,
            spreadRadius: 0,
            color: BOXSHADOWCOLOR,
          ),
          BoxShadow(
              offset: Offset.zero,
              blurRadius: 0,
              spreadRadius: 0,
              color: Colors.white)
        ],
      ),
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: ShapeDecoration(
                  shape: CircleBorder(),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: _currency.bgColor,
                  ),
                ),
                child: _currency.icon,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text(_currency.name,
                      style: Theme.of(context).textTheme.headline1),
                ),
              ),
              Text(
                _currency.tag,
                style: TextStyle(color: ACCENTCOLOR, fontSize: 18),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_currency.position,
                      style: Theme.of(context).textTheme.headline2),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    _currency.price,
                    style: Theme.of(context).textTheme.headline3,
                  )
                ],
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: ShapeDecoration(
                  shape: StadiumBorder(),
                  color: _currency.percent.contains('+') ? RISE : DROP,
                ),
                child: Text(
                  _currency.percent,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Entypo.down_open,
                  color: ACCENTCOLOR,
                ),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}
