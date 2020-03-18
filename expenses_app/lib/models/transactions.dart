import 'package:flutter/foundation.dart';

class Transactions {
  final String item, shopName;
  final int amount;
  final DateTime purchaseDate;

  Transactions(
      {@required this.item,
      @required this.shopName,
      @required this.amount,
      @required this.purchaseDate});
}
