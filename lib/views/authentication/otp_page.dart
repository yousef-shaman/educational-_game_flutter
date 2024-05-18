import 'package:flutter/material.dart';
import 'package:graduation_project_flutter/forms/create_profile.dart';
import 'package:graduation_project_flutter/services/auth_service.dart';
import 'package:graduation_project_flutter/widgets/gradient_scaffold.dart';

import '../../constants/text_style.dart';

class OTPVerificationPage extends StatefulWidget {
  final String password;
  final String email; // Pass the user's email as an argument
  const OTPVerificationPage(
      {super.key, required this.email, required this.password});

  @override
  State<OTPVerificationPage> createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  final _otpController = TextEditingController();
  final authUser = APIAuth();
  bool isLoad = false;

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  void handleOTPSubmission() async {
    bool isValidOTP =
        await APIAuth().verifyOTP(widget.email, _otpController.text);

    // Check if the state is still mounted before updating the UI
    if (mounted) {
      if (isValidOTP) {
        setState(() => isLoad = true);
        authUser.logIn(widget.email, widget.password).then((value) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const CreateProfile()),
          );
        });
      } else {
        // Handle invalid OTP with proper widget
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Invalid OTP'),
            content: const Text('Please try again.'),
            actions: <Widget>[
              TextButton(
                // Updated from FlatButton to TextButton
                child: const Text('OK'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text("Verify Your Email",textAlign: TextAlign.start,
                    style: labelLarge),
                    const SizedBox(height: 70),
              Text("Enter the OTP sent to [ ${widget.email} ]",
                    style: labelSmall),
              TextField(
                controller: _otpController,
                decoration: const InputDecoration(labelText: "OTP"),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: handleOTPSubmission,
                child: const Text('Verify'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
