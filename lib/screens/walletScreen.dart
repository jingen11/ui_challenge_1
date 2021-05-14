import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';

import '../models/currency.dart';
import '../widgets/actionButton.dart';
import '../widgets/currencyCard.dart';
import '../widgets/graph.dart';
import '../const/color.dart';

class WalletScreen extends StatefulWidget {
  static const routeName = "/walletScreen";
  final Currency _currency;
  final Function callback;
  WalletScreen(this._currency, this.callback);

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  int _durationIndex;
  @override
  void initState() {
    _durationIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final Map<String, Object> params =
    //     ModalRoute.of(context).settings.arguments as Map<String, Object>;
    // final Currency _currency = params['currency'];
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 0.75),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              widget.callback(null);
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.more_vert_rounded),
              onPressed: () {},
            ),
          ],
          title: Text(
            '${widget._currency.name} Wallet',
            style: TextStyle(
              color: PRIMARYCOLOR,
            ),
          ),
        ),
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: BGCOLOR,
            ),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CurrencyCard(
                  Currency(
                    icon: Icon(
                      FontAwesome.bitcoin,
                      color: Colors.white,
                    ),
                    earning: '\$ 19.153 USD',
                    name: 'Bitcoin',
                    position: '3.529020 BTC',
                    price: '\$ 19.153 USD',
                    percent: '- 2.32%',
                    bgColor: [
                      BTCLIGHT,
                      BTCDARK,
                    ],
                    tag: 'BTC',
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          print('0');
                          if (_durationIndex == 0) return;
                          setState(() {
                            _durationIndex = 0;
                          });
                        },
                        child: _durationIndex == 0
                            ? SelectedContainer('Day')
                            : Text('Day'),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_durationIndex == 1) return;
                          setState(() {
                            _durationIndex = 1;
                          });
                        },
                        child: _durationIndex == 1
                            ? SelectedContainer('Week')
                            : Text('Week'),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_durationIndex == 2) return;
                          setState(() {
                            _durationIndex = 2;
                          });
                        },
                        child: _durationIndex == 2
                            ? SelectedContainer('Month')
                            : Text('Month'),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_durationIndex == 3) return;
                          setState(() {
                            _durationIndex = 3;
                          });
                        },
                        child: _durationIndex == 3
                            ? SelectedContainer('Year')
                            : Text(
                                'Year',
                              ),
                      ),
                    ],
                  ),
                ),
                Graph(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ActionButton(widget._currency.tag, true),
                    ActionButton(widget._currency.tag, false),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SelectedContainer extends StatelessWidget {
  final String title;

  const SelectedContainer(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      decoration: ShapeDecoration(
        shape: StadiumBorder(),
        color: ACCENTCOLOR,
      ),
      child: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
