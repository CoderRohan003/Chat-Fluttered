
import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class RegisterPage extends StatelessWidget {
  // Text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  // Tap mechanism to go to the login page
  void Function()? onTap;

  // Constructor for RegisterPage
  RegisterPage({Key? key, required this.onTap}) : super(key: key);

  // Register method to create a user
  void register(BuildContext context) {
    // Get auth service
    final _auth = AuthService();

    // Check if passwords match, then create user
    if (passwordController.text == confirmPasswordController.text) {
      try {
        _auth.signUpWithEmailPassword(emailController.text, passwordController.text);
      } catch (e) {
        // Show error dialog if signup fails
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    } else {
      // Show alert if passwords don't match
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Passwords don't match"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 40.0),

            // Welcome back message
            Text(
              "Create an account and get started",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 40.0),

            // Email textfield
            MyTextField(
              hintText: "Enter Email",
              hide: false,
              controller: emailController,
            ),
            const SizedBox(height: 10.0),

            // Password textfield
            MyTextField(
              hintText: "Enter Password",
              hide: true,
              controller: passwordController,
            ),
            const SizedBox(height: 30.0),

            // Confirm Password textfield
            MyTextField(
              hintText: "Confirm Password",
              hide: true,
              controller: confirmPasswordController,
            ),
            const SizedBox(height: 35.0),

            // Register button
            MyButton(text: "Register", onTap: () => register(context)),
            const SizedBox(height: 30.0),

            // Register now or login message
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?  ",
                  style: TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
