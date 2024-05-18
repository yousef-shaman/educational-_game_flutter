import 'package:flutter/material.dart';
import 'package:graduation_project_flutter/models/user/faculty_departemnt.dart';
import 'package:graduation_project_flutter/services/faculty_departemnt_service.dart';
import 'package:graduation_project_flutter/services/user_service.dart';
import 'package:graduation_project_flutter/widgets/date_picker.dart';
import 'package:graduation_project_flutter/widgets/dropdown.dart';
import 'package:graduation_project_flutter/widgets/gradient_scaffold.dart';
import 'package:graduation_project_flutter/widgets/text_form_field.dart';

import '../constants/constants.dart';
import '../constants/text_style.dart';
import '../models/user/student.dart';
import '../utilities/jwt_decoder.dart';
import '../utilities/local_storge.dart';
import '../widgets/btm_nvg_bar.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key});

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  final _gpaController = TextEditingController();
  final _birthDateController = TextEditingController();
  List<GetFacultyDepartmen> _faculties = [];
  int? _selectedFacultyId; // Store selected faculty ID
  String? _selectedGender;
  int? _userId;
  int? _studentProfileId;

  @override
  void initState() {
    super.initState();
    fetchUserId();
    fetchFaculties();
  }

  void fetchUserId() async {
    String? token = await getData(accessToken);
    if (token != null) {
      int userId = decodeToken(token);
      setState(() {
        _userId = userId;
        print("_userId : $_userId");
      });
      print("userId : $userId");
      fetchStudentProfileData(userId);
    } else {
      print("No token found, user is probably not logged in");
    }
  }

  void fetchFaculties() {
    FacultyDepartmenAPI().fetchFaculties().then((faculties) {
      setState(() {
        _faculties = faculties;
      });
    });
  }

  void fetchStudentProfileData(int userId) async {
    try {
      List<GetStudent> studentProfiles = await UserAPI().fetchStudentData(userId);
      print("Error student data: $studentProfiles");
      if (studentProfiles.isNotEmpty) {
        setState(() {
          _studentProfileId = studentProfiles.first.id;  // Assuming you need the first profile's ID
          print("fetching student data: $_studentProfileId");
        });
      }
    } catch (e) {
      print("Error fetching student data: $e");
    }
  }

  bool validateFormData() {
    if (_selectedFacultyId == null ||
        _selectedGender == null ||
        _birthDateController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all required fields ++')),
      );
      return false;
    }
    if (_gpaController.text.isNotEmpty) {
      try {
        double.parse(_gpaController.text);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter a valid GPA')),
        );
        return false;
      }
    }
    return true;
  }

  Future<void> submitProfile() async {
    if (!validateFormData()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please ensure all fields are filled correctly')),
      );
      return;
    }
    if (_studentProfileId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No student profile available. Please check your registration.')),
      );
      return;
    }

    bool success = await UserAPI().submitStudentProfile(
      _studentProfileId!,
      _selectedFacultyId!,
      DateTime.parse(_birthDateController.text),
      _selectedGender!,
      _gpaController.text.isEmpty ? 0.0 : double.tryParse(_gpaController.text)!,
      1, // Assuming level is set by some business logic
      0, // Assuming initial points
    );

    // Check if the widget is still mounted before attempting to update the UI
    if (mounted) {
      if (success) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const CustomBtmNvgBar()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to create profile')),
        );
      }
    }
  }

  Future<void> _selectbirthDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1965),
      lastDate: DateTime(2014),
    );
    if (picked != null) {
      setState(() {
        _birthDateController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  void dispose() {
    _gpaController.dispose();
    _birthDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('Complete Your Profile',
                    textAlign: TextAlign.left,
                    style: labelLarge),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                        child: CustomDropdown<String>(
                      items: ['Male', 'Female'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      selectedValue: _selectedGender,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedGender = newValue;
                        });
                      },
                      hint: 'Select Gender',
                    )),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CustomTextFormField(
                        keyboardType: TextInputType.number,
                        labelText: 'GPA',
                        hintText: 'Enter your GPA',
                        controller: _gpaController, maxLength: 5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                CustomDatePickerField(
                  externalOnTap: () => _selectbirthDate(context),
                  labelText: 'Birth Date',
                  hintText: 'Enter your birth date',
                  controller: _birthDateController,
                ),
                const SizedBox(height: 10),
                CustomDropdown(
                  items: _faculties
                      .map((faculty) => DropdownMenuItem(
                            value: faculty.id,
                            child: Text(faculty.departmentName!),
                          ))
                      .toList(),
                  selectedValue: _selectedFacultyId,
                  onChanged: (value) {
                    setState(() {
                      _selectedFacultyId = value as int; // Cast as needed
                    });
                  },
                  hint: 'Select your Department',
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: submitProfile,
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
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
