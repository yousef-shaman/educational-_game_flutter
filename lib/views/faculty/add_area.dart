import 'package:flutter/material.dart';
import 'package:graduation_project_flutter/widgets/custom_dropdown.dart';
import 'package:graduation_project_flutter/widgets/custom_gradient_scaffold.dart';
import 'package:graduation_project_flutter/widgets/custom_text_form_field.dart';

class AddArea extends StatefulWidget {
  const AddArea({super.key});

  @override
  State<AddArea> createState() => _AddAreaState();
}

class _AddAreaState extends State<AddArea> {
  final _areaNameController = TextEditingController();
  final _areaDescriptionController = TextEditingController();
  String? _selectedTheField;
  String? _selectedMaxPoint;

  final List<String> _fields = ['Science', 'Engineering', 'Arts', 'Business'];
  final List<String> _maxpoint = [
    'Computer Science',
    'Electrical Engineering',
    'Psychology',
    'Marketing'
  ];

  @override
  void dispose() {
    _areaNameController.dispose();
    _areaDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      appBar: AppBar(
        title: const Text("Create a new Area"),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'New Area',
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.displayLarge,
              ),

              const SizedBox(height: 30),
              CustomTextFormField(
                labelText: 'Area Name',
                hintText: 'Enter the Area Name',
                controller: _areaNameController,
              ),

              const SizedBox(height: 30), //Some spacing between the fields
              CustomTextFormField(
                maxLines: 4,
                keyboardType: TextInputType.multiline,
                labelText: 'Area Description',
                hintText: 'Enter the Area Description',
                controller: _areaDescriptionController,
              ),

              const SizedBox(height: 30),
              CustomDropdown(
                items: _fields,
                selectedValue: _selectedTheField,
                onChanged: (value) => setState(() => _selectedTheField = value),
                hint: 'Select the Field',
              ),
              const SizedBox(height: 30),
              CustomDropdown(
                items: _maxpoint,
                selectedValue: _selectedMaxPoint,
                onChanged: (value) => setState(() => _selectedMaxPoint = value),
                hint: 'Select Max Point',
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Logic to handle form submission
                },
                style: Theme.of(context).elevatedButtonTheme.style,
                child: const Text('Craete'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
