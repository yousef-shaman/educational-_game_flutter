import 'package:flutter/material.dart';

class CustomDatePickerField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final VoidCallback? externalOnTap;  // Renamed for clarity

  const CustomDatePickerField({
    super.key,
    required this.labelText,
    required this.hintText, 
    this.controller, 
    this.externalOnTap,  // Renamed for clarity
  });

  @override
  State<CustomDatePickerField> createState() => _CustomDatePickerFieldState();
}

class _CustomDatePickerFieldState extends State<CustomDatePickerField> {
  late TextEditingController _internalController;

  @override
  void initState() {
    super.initState();
    _internalController = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _internalController.dispose();  // Only dispose if it's internally managed
    }
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != DateTime.now()) {
      setState(() {
        _internalController.text = "${picked?.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.externalOnTap ?? () => _selectDate(context), // Use provided onTap if not null, otherwise use internal
      child: IgnorePointer(
        child: TextFormField(
          style: const TextStyle(color: Colors.black),
          controller: _internalController, // Use the correct controller
          decoration: InputDecoration(
            labelText: widget.labelText,
            hintText: widget.hintText,
            suffixIcon: const Icon(Icons.calendar_today),
            border: const OutlineInputBorder(),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.0),
            ),
          ),
        ),
      ),
    );
  }
}
