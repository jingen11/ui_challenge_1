import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/currencyListTile.dart';
import '../widgets/walletCard.dart';
import '../models/currency.dart';
import '../models/wallets.dart';
import '../data/currencyData.dart';
import '../data/walletData.dart';
import '../screens/walletScreen.dart';
import '../const/color.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Currency> currencies = CURRENCY;
  final List<Wallet> wallets = WALLET;
  String _dropDownValue;
  Currency _selectedCurrency;

  @override
  void initState() {
    _dropDownValue = "24H";
    _selectedCurrency = null;
    super.initState();
  }

  void onSelectCurrency(Currency selectedCurrency) {
    print('press');
    setState(() {
      _selectedCurrency = selectedCurrency;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(child: child, scale: animation);
      },
      child: _selectedCurrency == null
          ? MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 0.75),
              child: Scaffold(
                appBar: AppBar(
                  title: Text(
                    "Wallets",
                    style: TextStyle(
                      color: PRIMARYCOLOR,
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 18.0, top: 8.0, left: 8.0, bottom: 8.0),
                      child: Center(
                        child: FaIcon(
                          FontAwesomeIcons.folderPlus,
                        ),
                      ),
                    ),
                  ],
                  leading: Builder(
                    builder: (BuildContext context) => IconButton(
                      icon: Icon(
                        Icons.sort_rounded,
                      ),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    ),
                  ),
                ),
                drawer: Drawer(
                  child: Text('hello'),
                ),
                body: Center(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: BGCOLOR,
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 220,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(left: 25, top: 20),
                          child: ListView.builder(
                            padding: EdgeInsets.all(0),
                            itemCount: WALLET.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (ctx, index) {
                              return Container(
                                padding: const EdgeInsets.only(right: 10),
                                child: WalletCard(WALLET[index]),
                              );
                            },
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 5),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Sorted by higher%',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4),
                                    DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        onChanged: (val) {
                                          setState(() {
                                            _dropDownValue = val;
                                          });
                                        },
                                        value: _dropDownValue,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: ACCENTCOLOR,
                                        ),
                                        items: [
                                          DropdownMenuItem(
                                            child: Text("24H"),
                                            value: "24H",
                                          ),
                                          DropdownMenuItem(
                                            child: Text('1H'),
                                            value: "!H",
                                          ),
                                          DropdownMenuItem(
                                            child: Text("30M"),
                                            value: "30M",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: ListView.builder(
                                      itemBuilder: (ctx, index) {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 20),
                                          child: CurrencyListTile(
                                              currencies[index],
                                              onSelectCurrency),
                                        );
                                      },
                                      itemCount: currencies.length,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : WalletScreen(_selectedCurrency, onSelectCurrency),
    );
  }
}
