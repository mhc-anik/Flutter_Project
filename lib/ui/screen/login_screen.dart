import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screen/Sign_Up_Screen.dart';
import 'package:task_manager/ui/widgets/screen_backGround.dart';

import 'Fortgot_Password_Verification.dart';
import 'main_nav_bar_holder_Screen.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screenBackGround(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //SizedBox(height: 100),
                      Text(
                        "Get Started With",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(hintText: "Email"),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(hintText: "Password"),
                      ),
                      SizedBox(height: 20),
                      Column(
                        children: [
                          FilledButton(
                            onPressed: _onTabLoginButton,
                            child: Icon(
                              Icons.arrow_circle_right_outlined,
                              size: 25,
                            ),
                          ),
                          SizedBox(height: 20),
                          TextButton(
                            onPressed: _onTabForgotPasswordButton,
                            child: Text(
                              "Forgot Password ?",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: "Don't Have Account ? ",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                TextSpan(
                                  text: "Sign Up",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = _onTabSignUpButton,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTabSignUpButton() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => SignUpScreen()));
  }

  void _onTabForgotPasswordButton() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => forgotPasswordVerificaton()),
    );
  }

  void _onTabLoginButton() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => MainNavBarHolderScreen(),
      ),
        (predicate) => false,
    );
  }

  dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
