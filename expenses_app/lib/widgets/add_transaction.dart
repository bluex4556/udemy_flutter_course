import 'package:flutter/material.dart';

class AddTransaction extends StatelessWidget {

  final Function addTransactionHandler;

  final nameController = new TextEditingController();
  final priceController = new TextEditingController();
  final shopNameController = new TextEditingController();

  AddTransaction(this.addTransactionHandler);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: "Name",
            ),
            controller: nameController,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "Price",
            ),
            controller: priceController,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "Shop Name",
            ),
            controller: shopNameController,
          ),
          MaterialButton(
            color: Colors.blue,
            child: Text("Add Item"),
            textColor: Colors.white,
            onPressed: ()=>addTransactionHandler(nameController.text, priceController.text, shopNameController.text),
          )
        ],
      ),
    );
  }
}
