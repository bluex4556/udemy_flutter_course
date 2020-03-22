import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddTransaction extends StatefulWidget {

  final Function addTransactionHandler;


  AddTransaction(this.addTransactionHandler);

  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final nameController = new TextEditingController();

  final priceController = new TextEditingController();

  final shopNameController = new TextEditingController();

  void submitTransaction()
  {
    final name = nameController.text;
    final price = priceController.text;
    final shopName = shopNameController.text;
    if(name.isEmpty || price.isEmpty || shopName.isEmpty)
      return;
    else {
      widget.addTransactionHandler(name, price, shopName);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextField(
            autofocus: true,
            decoration: InputDecoration(
              labelText: "Name",
            ),
            controller: nameController,
            onSubmitted: (_)=>submitTransaction(),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "Price",
            ),
            keyboardType: TextInputType.numberWithOptions(
              decimal: false,
              signed: false,
            ),
            onSubmitted: (_)=>submitTransaction(),
            inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
            controller: priceController,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "Shop Name",
            ),
            controller: shopNameController,
            onSubmitted: (_)=>submitTransaction(),
          ),

          MaterialButton(
            color: Theme.of(context).accentColor,
            child: Text("Add Item"),
            textColor: Theme.of(context).textTheme.button.color,
            onPressed: submitTransaction,
          )
        ],
      ),
    );
  }
}
