import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

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

  DateTime _selectedDate;

  void submitTransaction()
  {
    final name = nameController.text;
    final price = priceController.text;
    final shopName = shopNameController.text;
    if(name.isEmpty || price.isEmpty || shopName.isEmpty)
      return;
    else {
      final chosenDate = _selectedDate;
      widget.addTransactionHandler(name, price, shopName, chosenDate);
      Navigator.pop(context);
    }
  }

  void _presentDatePicker()
  {
    showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2010), lastDate: DateTime.now()).then(
        (pickedDate){
          if(pickedDate == null)
              return;
          else
            setState(() {
              _selectedDate = pickedDate;
            });
        }
    );
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
          Container(
//            width: 10,
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text( _selectedDate == null? "No date Chosen": DateFormat.yMd().format(_selectedDate)),
                FlatButton(
                  onPressed: _presentDatePicker,
                  child: Text(_selectedDate == null? "Choose Date": "Change Date",
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold  ),),
                  textColor: Theme.of(context).accentColor,
                )
              ],
            ),
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
