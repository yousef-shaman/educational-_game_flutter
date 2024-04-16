import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> items;
  final  String? selectedValue;
  final ValueChanged<String?> onChanged;
  final String hint;
  const CustomDropdown({super.key, required this.items, this.selectedValue, required this.onChanged, required this.hint});

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {


  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: widget.selectedValue,
      items: widget.items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        labelText: widget.hint,
        border: const OutlineInputBorder(),
      ),
    );
  }
}