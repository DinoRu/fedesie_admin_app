import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

String? selectValue;

class DropdownBtn extends StatelessWidget {
  final List<String> category;
  final String selectItemText;
  final Function(String?) onSelected;
  const DropdownBtn({super.key, required this.category, required this.selectItemText, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return  Card(
      child: Center(
        child: DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            hint: Text(
              selectItemText,
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).hintColor,
              ),
            ),
            items: category
                .map((String item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ))
                .toList(),
            value: selectValue,
            onChanged: (String? value) {
                onSelected(value);
            },
            buttonStyleData: const ButtonStyleData(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 40,
              width: 140,
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
            ),
          ),
        ),
      ),
    );
  }
}
