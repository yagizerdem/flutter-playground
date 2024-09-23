import 'package:app/class/expanse.dart';
import 'package:app/class/expanse_types.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key, required this.addExpanse});

  final Function(Expanse expanse) addExpanse;

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  DateTime? _selectedDate;
  Expansetypes _expenseType = Expansetypes.food;

  final titleController = TextEditingController();
  final priceContorller = TextEditingController();

  void selectDate() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  String formatDate(dateString) {
    DateFormat format = new DateFormat("yyyy-MM-dd");
    DateTime dateTime = format.parse(dateString);
    String formattedDate = DateFormat("yyyy-MM-dd").format(dateTime);
    return formattedDate;
  }

  void submit() {
    String title = titleController.text;
    double? price = double.tryParse(priceContorller.text);
    bool isPriceValid = price != null && price > 0;
    if (title.trim() != "" && isPriceValid && _selectedDate != null) {
      Expanse newExpnase = Expanse(
          price: price,
          expnaseType: _expenseType,
          date: _selectedDate!,
          title: title);
      widget.addExpanse(newExpnase);
      Navigator.pop(context);
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Invalid Expense Data'),
            content: const SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Please fill in all required fields.'),
                  Text(
                      'Ensure that the price is valid and a date is selected.'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Title',
            ),
          ),
          const SizedBox(height: 16.0), // Adds space between elements
          Row(
            children: [
              Expanded(
                // Wrap the TextField with Expanded
                child: TextField(
                  controller: priceContorller,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter
                        .digitsOnly, // Allows only digits
                  ],
                  decoration: const InputDecoration(
                    hintText: "Enter a number",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton.icon(
                onPressed: selectDate,
                icon: const Icon(Icons.calendar_month),
                label: Text(
                    "select date (${_selectedDate == null ? "not selected" : formatDate(_selectedDate.toString())})"),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(5.0), // Border radius 5px
                  ),
                ),
              )
            ],
          ),
          DropdownButton<Expansetypes>(
            value: _expenseType,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (Expansetypes? value) {
              setState(() {
                if (value != null) {
                  _expenseType = value;
                }
              });
            },
            items: Expansetypes.values
                .map<DropdownMenuItem<Expansetypes>>((Expansetypes value) {
              return DropdownMenuItem<Expansetypes>(
                value: value,
                child: Text(value.toString().split('.')[1]),
              );
            }).toList(),
          ),
          Row(
            children: [
              const Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("cancel")),
              TextButton(
                  onPressed: () {
                    submit();
                  },
                  child: const Text("submit"))
            ],
          )
        ],
      ),
    );
  }
}
