import 'dart:math';

import 'package:app/class/expanse.dart';
import 'package:app/class/expanse_types.dart';
import 'package:flutter/material.dart';

class ExpanseCard extends StatefulWidget {
  const ExpanseCard({super.key, required this.expanse});
  final Expanse expanse;

  @override
  State<ExpanseCard> createState() => _CardState();
}

class _CardState extends State<ExpanseCard> {
  String get formattedDate {
    String y = widget.expanse.date.year.toString();
    String m = widget.expanse.date.month.toString();
    String d = widget.expanse.date.day.toString();
    return "$d/$m/$y";
  }

  Icon get getIcon {
    if (widget.expanse.expnaseType == Expansetypes.food) {
      return const Icon(Icons.food_bank);
    } else if (widget.expanse.expnaseType == Expansetypes.leisure) {
      return const Icon(Icons.hotel);
    } else if (widget.expanse.expnaseType == Expansetypes.travel) {
      return const Icon(Icons.flight);
    } else {
      return const Icon(Icons.work);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Set width to fill the screen
      padding: const EdgeInsets.all(30.0), // Padding of 8 pixels
      margin: const EdgeInsets.all(30.0), // Margin of 10 pixels
      decoration: BoxDecoration(
        color: Colors.white, // Background color of the container
        borderRadius: BorderRadius.circular(10.0), // Optional: round corners
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Shadow color
            spreadRadius: 2, // Spread radius
            blurRadius: 5, // Blur radius
            offset: Offset(0, 3), // Changes the position of the shadow (x, y)
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [Text(widget.expanse.title)],
          ),
          Row(
            children: [
              Text("\$ ${widget.expanse.price}"),
              const Spacer(),
              getIcon,
              Text("$formattedDate"),
            ],
          ),
        ],
      ),
    );
  }
}
