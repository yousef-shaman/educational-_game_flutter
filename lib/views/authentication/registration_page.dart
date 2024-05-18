import 'package:flutter/material.dart';
import 'package:graduation_project_flutter/views/authentication/otp_page.dart';
import 'package:graduation_project_flutter/services/auth_service.dart';
import 'package:graduation_project_flutter/views/authentication/signin_page.dart';
import 'package:graduation_project_flutter/widgets/gradient_scaffold.dart';
import 'package:graduation_project_flutter/widgets/text_form_field.dart';

import '../../constants/text_style.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repasswordController = TextEditingController();
  final _eduIdController = TextEditingController();
  final _roleController = TextEditingController(
      text: "S"); // Assuming role is predetermined or selected elsewhere

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _repasswordController.dispose();
    _eduIdController.dispose();
    _roleController.dispose();
    super.dispose();
  }

  bool validateForm() {
    // Simple validation: Checks if any field is empty
    if (_firstNameController.text.isEmpty ||
        _lastNameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _repasswordController.text.isEmpty ||
        _eduIdController.text.isEmpty ||
        _passwordController.text != _repasswordController.text) {
      // Show an error message or handle error state
      print("Please fill all fields and ensure passwords match.");
      return false;
    }
    return true;
  }

  void handleRegistrationSuccess(String email, String password) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => OTPVerificationPage(email: email, password: password,),
      ),
    );
  }

  void handleSubmit() async {
    if (validateForm()) {
      bool success = await APIAuth().register(
        _emailController.text,
        _firstNameController.text,
        _lastNameController.text,
        _roleController.text,
        _eduIdController.text,
        _passwordController.text,
        _repasswordController.text,
      );

      if (mounted) {
        if (success) {
          handleRegistrationSuccess(_emailController.text, _passwordController.text);
        } else {
          // Optionally, handle registration failure logic
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Registration Failed'),
              content: const Text('Please check your details and try again.'),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          );
        }
      }
    }
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
                const Text('REGISTRATION FORM',
                    textAlign: TextAlign.left,
                    style: labelLarge),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      // Wrap the first field in an Expanded widget
                      child: CustomTextFormField(
                        labelText: 'First name',
                        hintText: 'Enter your first name',
                        controller: _firstNameController,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length > 100) {
                            return 'Enter a valid First name';
                          }
                          return null;
                        }, maxLength: 100,
                      ),
                    ),
                    const SizedBox(
                        width: 10), // Add some spacing between the fields
                    Expanded(
                      // Wrap the second field in an Expanded widget
                      child: CustomTextFormField(
                        labelText: 'Last name',
                        hintText: 'Enter your last name',
                        controller: _lastNameController,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length > 100) {
                            return 'Enter a valid Last name';
                          }
                          return null;
                        }, maxLength: 100,
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
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !value.contains('@') ||
                        value.length > 255) {
                      return 'Enter a valid email';
                    }
                    return null;
                  }, maxLength: 255,
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  labelText: 'EDU ID',
                  hintText: 'Enter your edu id',
                  controller: _eduIdController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length > 50) {
                      return 'Enter a valid EDU ID';
                    }
                    return null;
                  }, maxLength: 50,
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  controller: _passwordController,
                  obscureText: true,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.length < 6 ||
                        value.length > 68) {
                      return 'Password must be 6-68 characters long';
                    }
                    return null;
                  }, maxLength: 68,
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  labelText: 'Re-enter Password',
                  hintText: 'Confirm your password',
                  controller: _repasswordController,
                  obscureText: true,
                  validator: (value) {
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  }, maxLength: 68,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: handleSubmit,
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
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const SignInPage()));
                    },
                    child: const Text("I already have an account",
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 14,
                            fontWeight: FontWeight.bold)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
