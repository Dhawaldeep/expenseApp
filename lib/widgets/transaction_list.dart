import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;
  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                Text('No transactions added yet',
                    style: Theme.of(context).textTheme.headline6),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          })
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              return Card(
                  margin: EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 8,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text(
                            '\$${transactions[index].amount.toStringAsFixed(2)}',
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                        DateFormat.yMMMMd().format(transactions[index].date)),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () {
                        deleteTransaction(transactions[index].id);
                      },
                    ),
                  ));
            },
          );
  }
}
// child: Row(
//     // mainAxisAlignment: MainAxisAlignment.spaceAround,
//     children: <Widget>[
//       Container(
//         margin: EdgeInsets.symmetric(
//           horizontal: 10,
//           vertical: 15,
//         ),
//         decoration: BoxDecoration(
//             border: Border.all(
//           color: Colors.purple,
//           width: 2,
//         )),
//         padding: EdgeInsets.all(10),
//         child: Text(
//           '\$${transactions[index].amount.toStringAsFixed(2)}',
//           style: TextStyle(
//               color: Colors.purple,
//               fontWeight: FontWeight.bold,
//               fontSize: 20),
//         ),
//       ),
//       Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Text(
//             transactions[index].title,
//             style: TextStyle(
//                 fontWeight: FontWeight.bold, fontSize: 15),
//           ),
//           Text(
//             DateFormat.yMMMd("en_US")
//                 .add_jm()
//                 .format(transactions[index].date),
//             style: TextStyle(color: Colors.grey),
//           )
//         ],
//       )
//     ]),
