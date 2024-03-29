import 'package:flutter/material.dart';
import 'package:graduation_project_flutter/widgets/custom_text_form_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // Initialize the TextEditingController instances.
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // Dispose the controllers when the widget is removed from the widget tree.
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose(); // Call the superclass dispose method last.
  }

  @override
  Widget build(BuildContext context) {
    // The rest of your widget build method
    return Scaffold(
      // appBar: AppBar(title: const Text('Sign in -P')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'SIGN IN',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.black,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            CustomTextFormField(
              labelText: 'Username',
              hintText: 'Enter your username',
              controller: _usernameController,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              labelText: 'Password',
              hintText: 'Enter your password',
              obscureText: true,
              controller: _passwordController,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Here you would typically call a method that handles user authentication,
                // like so:
                // signInUser(_usernameController.text, _passwordController.text);
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.blueGrey,
                shape: const StadiumBorder(),
              ),
              child: const Text('Sign in'),
            ),
          ],
        ),
      ),
    );
  }
}
