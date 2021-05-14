import 'package:flutter/material.dart';

import '../models/currency.dart';
import '../const/color.dart';

class CurrencyListTile extends StatelessWidget {
  final Currency _currency;
  final Function callback;
  CurrencyListTile(this._currency, this.callback);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('inkwell');
        callback(this._currency);
      },
      child: Container(
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
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: ListTile(
          leading: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [_currency.bgColor[0], _currency.bgColor[1]],
                    ),
                  ),
                  child: Center(
                    child: FittedBox(child: _currency.icon),
                  ),
                ),
              ],
            ),
          ),
          title: Text(
            _currency.position,
            style: Theme.of(context).textTheme.headline5,
          ),
          subtitle: Text(
            _currency.price,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                _currency.earning,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                  color: PRIMARYCOLOR,
                ),
              ),
              SizedBox(height: 5),
              Text(
                _currency.percent,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: _currency.percent.contains('+') ? RISE : DROP,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
