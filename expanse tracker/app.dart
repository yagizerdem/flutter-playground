import 'package:app/class/expanse.dart';
import 'package:app/class/expanse_types.dart';
import 'package:app/widgets/add_newexpense.dart';
import 'package:app/widgets/custom_chart.dart';
import 'package:app/widgets/expanse_card.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  List<Expanse> allExpenses = [];

  @override
  void initState() {
    super.initState();
    allExpenses.add(Expanse(
        price: 10,
        expnaseType: Expansetypes.leisure,
        date: DateTime.now(),
        title: "expanse title leisure"));
    allExpenses.add(Expanse(
        price: 99,
        expnaseType: Expansetypes.work,
        date: DateTime.now(),
        title: "expanse title workd"));
    allExpenses.add(Expanse(
        price: 130,
        expnaseType: Expansetypes.travel,
        date: DateTime.now(),
        title: "travel expanse"));
  }

  void addExpanse(Expanse expanse) {
    setState(() {
      allExpenses.add(expanse); // Update the state
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Expense Tracker"),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => Container(
                    color: Colors.white,
                    height: 600,
                    child: AddExpense(
                      addExpanse: addExpanse,
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.shopping_bag_outlined),
            ),
          ],
        ),
        body: Column(
          children: [
            CustomChart(
              allExpanse: allExpenses,
            ),
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: allExpenses.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    return Dismissible(
                        key: UniqueKey(),
                        onDismissed: (direction) {
                          setState(() {
                            allExpenses.removeAt(index);
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('item dismissed')));
                          });
                        },
                        background: Container(
                          color: Colors.red, // Background color when dismissed
                          alignment: Alignment.centerLeft,
                          height: 10,
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: const Icon(Icons.delete,
                              color: Colors.white), // Icon on the background
                        ),
                        child: ExpanseCard(expanse: allExpenses[index]));
                  }),
            )
          ],
        ));
  }
}
