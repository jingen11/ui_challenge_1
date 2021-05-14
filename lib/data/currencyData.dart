import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/currency.dart';
import '../custom_icon_icons.dart';
import '../const/color.dart';

const CURRENCY = [
  Currency(
    name: "BitCoin",
    icon: Icon(
      FontAwesome.bitcoin,
      color: Colors.white,
    ),
    earning: '\$ 19.153',
    position: '3.529020 BTC',
    price: '\$ 5.441',
    percent: '+ 4.32%',
    bgColor: [
      BTCLIGHT,
      BTCDARK,
    ],
    tag: 'BTC',
  ),
  Currency(
    name: "Erthereum",
    icon: Icon(
      FontAwesomeIcons.ethereum,
      color: Colors.white,
    ),
    earning: '\$ 4.822',
    position: '12.633681 ETH',
    price: '\$ 401',
    percent: '+ 3.97%',
    bgColor: [
      ETHLIGHT,
      ETHDARK,
    ],
    tag: 'ETH',
  ),
  Currency(
    name: "Ripple",
    icon: Icon(
      CustomIcon.iconfinder_xrp_alt_1175359,
      color: Colors.white,
      size: 20,
    ),
    earning: '\$ 859',
    position: '1911.633681 XRP',
    price: '\$ 0.45',
    percent: '- 13.55%',
    bgColor: [
      XRPLIGHT,
      XRPDARK,
    ],
    tag: "XRP",
  ),
];
