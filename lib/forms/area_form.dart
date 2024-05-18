import 'package:flutter/material.dart';
import 'package:graduation_project_flutter/models/area/area.dart';
import 'package:graduation_project_flutter/services/area_api/area_service.dart';
import 'package:graduation_project_flutter/widgets/gradient_scaffold.dart';
import 'package:graduation_project_flutter/widgets/text_form_field.dart';
import '../constants/constants.dart';
import '../models/user/admin.dart';
import '../services/user_service.dart';
import '../utilities/jwt_decoder.dart';
import '../utilities/local_storge.dart';

class AreaForm extends StatefulWidget {
  final GetArea?
      area; // If null, the form is for creating a new area; otherwise, it's for updating an existing area

  const AreaForm({super.key, this.area});

  @override
  State<AreaForm> createState() => _AreaFormState();
}

class _AreaFormState extends State<AreaForm> {
  final _formKey = GlobalKey<FormState>();
  final _areaService = AreaServiceAPI();
  int? _userId;
  final TextEditingController _areaNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  bool _isActive = true;
  int? _adminProfileId;

  @override
  void initState() {
    super.initState();
    loadUserData();
    if (widget.area != null) {
      _areaNameController.text = widget.area!.areaName ?? '';
      _descriptionController.text = widget.area!.description ?? '';
      _isActive = widget.area!.isActive ?? true;
    }
  }

  Future<void> loadUserData() async {
    // Retrieve access token from local storage
    String? token = await getData(accessToken);
    if (token != null) {
      // Decode user ID from token
      int userId = decodeToken(token);
      setState(() {
        _userId = userId;
        print("_userId : $_userId");
      });
      fetchStudentProfileData(userId);
      print("userId : $userId");
    } else {
      print("No token found, user is probably not logged in");
    }
  }

  Future<void> fetchStudentProfileData(int userId) async {
    try {
      List<GetSystemAdmin> studentProfiles =
          await UserAPI().fetchAdminData(userId);
      if (studentProfiles.isNotEmpty) {
        var firstProfile = studentProfiles.first;
        setState(() {
          _adminProfileId = firstProfile.id;
          
        });
        print("_adminProfileId : $_adminProfileId");
      }
    } catch (e) {
      print("Error fetching student data: $e");
    }
  }

  @override
  void dispose() {
    _areaNameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final area = PostArea(
        adminProfile: _adminProfileId,
        areaName: _areaNameController.text,
        description: _descriptionController.text,
        isActive: _isActive,
        // adminProfile: widget.area?.adminProfile,
        facultyDepartment: widget.area?.facultyDepartment,
      );

      try {
        if (widget.area == null) {
          // Create a new area
          await _areaService.createArea(area);
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Area created successfully')));
        } else {
          // Update an existing area
          await _areaService.updateArea(widget.area!.id!, area);
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Area updated successfully')));
        }
        Navigator.of(context).pop();
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Failed to save area: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: Scaffold(
        appBar: AppBar(
          title: Text(widget.area == null ? 'Create Area' : 'Update Area'),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    widget.area == null ? 'New Area' : 'Update Area',
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(height: 30),
                  CustomTextFormField(
                    labelText: 'Area Name',
                    hintText: 'Enter the Area Name',
                    controller: _areaNameController,
                    maxLength: 100,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an area name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  CustomTextFormField(
                    labelText: 'Description',
                    hintText: 'Enter the Description',
                    controller: _descriptionController,
                    maxLines: 4,
                    maxLength: 2000,
                    keyboardType: TextInputType.multiline,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a description';
                      }
                      return null;
                    },
                  ),
                  SwitchListTile(
                    title: const Text('Is Active'),
                    value: _isActive,
                    onChanged: (bool value) {
                      setState(() {
                        _isActive = value;
                      });
                    },
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: _submitForm,
                    style: Theme.of(context).elevatedButtonTheme.style,
                    child: Text(widget.area == null ? 'Create' : 'Update'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
