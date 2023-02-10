import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTx(
      titleController.text,
      double.parse(amountController.text),
    );
    amountController.clear();
    titleController.clear();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            decoration: const InputDecoration(labelText: "Title"),
            controller: titleController,
            onSubmitted: (_) => submitData(),
          ),
          TextField(
            decoration: const InputDecoration(labelText: "Amount"),
            controller: amountController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submitData(),
          ),
          ElevatedButton(
              onPressed: submitData,
              child: const Text(
                "Add",
              )),
        ]),
      ),
    );
  }
}
