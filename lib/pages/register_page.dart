import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterPage extends StatelessWidget {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController ConfirmpasswordController = TextEditingController();

    // declaring tap mechanism to go to login page
  void Function()? onTap;

  RegisterPage({super.key , required this.onTap});

  // Register Method
  void register() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),

            const SizedBox(height: 50.0),

            // welcome back message
            Text(
              "Create an account and get started",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 50.0),

            //email textfield
            MyTextField(
              hintText: "Enter Email",
              hide: false,
              controller: emailController,
            ),

            const SizedBox(height: 15.0),

            // password textfield
            MyTextField(
              hintText: "Enter Password",
              hide: true,
              controller: passwordController,
            ),

            const SizedBox(height: 35.0),

            // Confirm Password 
            MyTextField(
              hintText: "Confirm Password",
              hide: true,
              controller: ConfirmpasswordController,
            ),

            const SizedBox(height: 35.0),

            //login button
            MyButton(text: "Register", onTap: register),

            const SizedBox(height: 35.0),

            // register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?  ",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text("Login",
                  style: TextStyle(color: Theme.of(context).colorScheme.primary , fontWeight: FontWeight.bold , decoration: TextDecoration.underline),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );;
  }
}