import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screen/Sign_Up_Screen.dart';
import 'package:task_manager/ui/widgets/screen_backGround.dart';

import 'Verify_OTP_Screen.dart';
import 'login_screen.dart';

class forgotPasswordVerificaton extends StatefulWidget {
  const forgotPasswordVerificaton({super.key});

  @override
  State<forgotPasswordVerificaton> createState() =>
      _forgotPasswordVerificatonState();
}

class _forgotPasswordVerificatonState extends State<forgotPasswordVerificaton> {
  final TextEditingController _emailController = TextEditingController();
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
                        "Enter Your Email Address",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        "A 6 Digit OTP Code Will Send to Your Email Address",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.deepOrange),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: "Enter Your Email Address :",
                        ),
                      ),

                      SizedBox(height: 20),
                      Column(
                        children: [
                          FilledButton(
                            onPressed: _onTabOTPButton,
                            child: Icon(
                              Icons.arrow_circle_right_outlined,
                              size: 25,
                            ),
                          ),
                          SizedBox(height: 20),
                          RichText(
                            text: TextSpan(
                              text: "Already Have an Account ? ",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                TextSpan(
                                  text: "Login",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = _onTabLoginButton,
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


  void _onTabLoginButton() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => loginScreen()));
  }

  void _onTabOTPButton() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => verifyOtpScreen()));
  }

  dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
