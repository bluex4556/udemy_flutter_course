import 'package:flutter/foundation.dart';

class Transactions{
  final String item,shopName;
  final int amount;
  final DateTime purchaseDate;

  Transactions({this.item,this.shopName,this.amount,this.purchaseDate});
}