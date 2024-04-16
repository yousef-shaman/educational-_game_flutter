import 'package:flutter/material.dart';

class CustomDatePickerField extends StatefulWidget {
  final String labelText;
  final String hintText;
  const CustomDatePickerField({
    super.key,
    required this.labelText,
    required this.hintText,
  });

  @override
  State<CustomDatePickerField> createState() => _CustomDatePickerFieldState();
}

class _CustomDatePickerFieldState extends State<CustomDatePickerField> {
  final TextEditingController _controller = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        _controller.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectDate(context),
      child: IgnorePointer(
        child: TextFormField(
          style: const TextStyle(color: Color(0xffFAF2E1)),
            controller: _controller,
            decoration: InputDecoration(
              labelText: widget.labelText,
              hintText: widget.hintText,
              suffixIcon: const Icon(Icons.calendar_today),
              border: const OutlineInputBorder(),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1.0),
              ),
            )),
      ),
    );
  }
}


