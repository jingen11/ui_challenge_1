import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/entypo_icons.dart';

import '../const/color.dart';
import '../models/wallets.dart';

class WalletCard extends StatefulWidget {
  final Wallet _wallet;

  WalletCard(this._wallet);
  @override
  _WalletCardState createState() => _WalletCardState();
}

class _WalletCardState extends State<WalletCard> {
  String _dropDownValue;
  @override
  void initState() {
    _dropDownValue = "USD";
    super.initState();
  }

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
          ]),
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                child: const Icon(
                  FontAwesome5.wallet,
                  color: Colors.white,
                  size: 17,
                ),
                backgroundColor: PRIMARYCOLOR,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text("Total Wallet Balance",
                      style: Theme.of(context).textTheme.headline1),
                ),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton(
                  onChanged: (val) {
                    setState(() {
                      _dropDownValue = val;
                    });
                  },
                  value: _dropDownValue,
                  style: Theme.of(context).textTheme.bodyText2,
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: ACCENTCOLOR,
                  ),
                  items: [
                    DropdownMenuItem(
                      child: Text("USD"),
                      value: "USD",
                    ),
                    DropdownMenuItem(
                      child: Text('GBP'),
                      value: "GBP",
                    ),
                    DropdownMenuItem(
                      child: Text("EUR"),
                      value: "EUR",
                    ),
                  ],
                ),
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
                  Text(widget._wallet.price,
                      style: Theme.of(context).textTheme.headline2),
                  SizedBox(
                    height: 5,
                  ),
                  Text(widget._wallet.name,
                      style: Theme.of(context).textTheme.headline3)
                ],
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: ShapeDecoration(
                  shape: StadiumBorder(),
                  color: widget._wallet.percent.contains('+') ? RISE : DROP,
                ),
                child: Text(widget._wallet.percent,
                    style: Theme.of(context).textTheme.bodyText1),
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
