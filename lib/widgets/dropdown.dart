import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>> items;
  final T? selectedValue;
  final ValueChanged<T?> onChanged;
  final String hint;

  const CustomDropdown({
    super.key,
    required this.items,
    this.selectedValue,
    required this.onChanged,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      value: selectedValue,
      items: items,
      onChanged: onChanged,
      hint: Text(hint),
      isExpanded: true,
    );
  }
}
