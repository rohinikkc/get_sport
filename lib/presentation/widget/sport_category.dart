import 'package:flutter/material.dart';
import 'package:getsport/data/db_controller.dart';
import 'package:getsport/data/functions.dart';
import 'package:provider/provider.dart';

class SportCategoryDropDown extends StatelessWidget {
  const SportCategoryDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DBFunctions>(builder: (context, controller, child) {
      return Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: DropdownButtonFormField(
            decoration: const InputDecoration(
                hintStyle: TextStyle(color: Colors.grey),
                hintText: "Sport Category"),
            validator: (value) {
              if (value == null) {
                return "Select category";
              } else {
                return null;
              }
            },
            items: DBFunctions.sport
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            onChanged: controller.selectSport),
      );
    });
  }
}
