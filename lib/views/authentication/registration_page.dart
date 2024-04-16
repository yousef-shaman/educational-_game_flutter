import 'package:flutter/material.dart';
import 'package:graduation_project_flutter/widgets/custom_dropdown.dart';
import 'package:graduation_project_flutter/widgets/custom_text_form_field.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  String? _selectedFaculty;
  String? _selectedMajor;

  final List<String> _faculties = [
    'Science',
    'Engineering',
    'Arts',
    'Business'
  ];
  final List<String> _majors = [
    'Computer Science',
    'Electrical Engineering',
    'Psychology',
    'Marketing'
  ];

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'REGISTRATION FORM',
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.displayLarge
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    // Wrap the first field in an Expanded widget
                    child: CustomTextFormField(
                      labelText: 'First name',
                      hintText: 'Enter your first name',
                      controller: _firstNameController,
                    ),
                  ),
                  const SizedBox(width: 10), // Add some spacing between the fields
                  Expanded(
                    // Wrap the second field in an Expanded widget
                    child: CustomTextFormField(
                      labelText: 'Last name',
                      hintText: 'Enter your last name',
                      controller: _lastNameController,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                labelText: 'Email',
                hintText: 'Enter your email',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 10),
              CustomDropdown(
                items: _faculties,
                selectedValue: _selectedFaculty,
                onChanged: (value) => setState(() => _selectedFaculty = value),
                hint: 'Select the Faculty',
              ),
              const SizedBox(height: 10),
              CustomDropdown(
                items: _majors,
                selectedValue: _selectedMajor,
                onChanged: (value) => setState(() => _selectedMajor = value),
                hint: 'Select Major',
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Logic to handle form submission
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text('Send'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
