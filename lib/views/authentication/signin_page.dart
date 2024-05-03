import 'package:flutter/material.dart';
import 'package:graduation_project_flutter/services/auth_service.dart';
import 'package:graduation_project_flutter/views/authentication/registration_page.dart';
import 'package:graduation_project_flutter/widgets/btm_nvg_bar.dart';
import 'package:graduation_project_flutter/widgets/gradient_scaffold.dart';
import 'package:graduation_project_flutter/widgets/text_form_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // Initialize the TextEditingController instances.
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final authUser = APIAuth();
  bool isLoad = false;

  void logIn(){
    setState(() => isLoad = true);
    authUser.logIn(_usernameController.text, _passwordController.text).then((value) {
      if (value){
        // getData(role);
        // if (role == 'A'){

        // }

        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const CustomBtmNvgBar()));
      }
      else {

      }
    });
  }
  

  @override
  void dispose() {
    // Dispose the controllers when the widget is removed from the widget tree.
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose(); // Call the superclass dispose method last.
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('SIGN IN',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.displayLarge),
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
                  logIn();

                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  shape: const StadiumBorder(),
                ),
                child: const Text('Sign in'),
              ),
              const SizedBox(height: 15),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const RegistrationPage()));
                  },
                  child: const Text("Tab here to registration",
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
    );
  }
}
