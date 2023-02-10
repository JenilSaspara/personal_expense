import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({
    super.key,
    required this.label,
    required this.spendingAmount,
    required this.pctOfTotal,
  });

  final String label;
  final double spendingAmount;
  final double pctOfTotal;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      FittedBox(child: Text('₹ ${spendingAmount.toStringAsFixed(0)}')),
      SizedBox(
        height: 4,
      ),
      Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: pctOfTotal,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )
            ],
          )),
      SizedBox(
        height: 4,
      ),
      Text(label),
    ]);
  }
}
