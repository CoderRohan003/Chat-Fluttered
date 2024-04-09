
import 'package:chat_app/auth/auth_service.dart';
import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // declaring tap mechanism to go to register page
  void Function()? onTap;

  LoginPage({super.key , required this.onTap});

  // login method
  void login(BuildContext context) async{
    // auth Service
    final authService = AuthService();

  // try login
  try {
    await authService.signInWithEmailPassword(_emailController.text, _passwordController.text);
  }

  // catch any error
  catch (e) {
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: Text(e.toString()),
      ));
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
            // logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),

            const SizedBox(height: 50.0),

            // welcome back message
            Text(
              "Welcome back, Enjoy !!",
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
              controller: _emailController,
            ),

            const SizedBox(height: 15.0),

            // password textfield
            MyTextField(
              hintText: "Enter Password",
              hide: true,
              controller: _passwordController,
            ),

            const SizedBox(height: 35.0),

            //login button
            MyButton(text: "Login", onTap: () => login(context)),

            const SizedBox(height: 35.0),

            // register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Text("Not a member? ",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text("Register Now!",
                  style: TextStyle(color: Theme.of(context).colorScheme.primary , fontWeight: FontWeight.bold , decoration: TextDecoration.underline),
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
