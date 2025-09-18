import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screen/Sign_Up_Screen.dart';
import 'package:task_manager/ui/widgets/screen_backGround.dart';
import 'Verify_OTP_Screen.dart';
import 'login_screen.dart';

class resetPasWordScreen extends StatefulWidget {
  const resetPasWordScreen({super.key});

  @override
  State<resetPasWordScreen> createState() => _resetPasWordScreenState();
}

class _resetPasWordScreenState extends State<resetPasWordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confrimPasswordController =
      TextEditingController();
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
                        "Set Password",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        "Minimum length of password is 8 and Uppercase and Lowercase and special character have to use. ",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter Your New Password :",
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _confrimPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Re Enter Your New Password :",
                        ),
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



  void _onTabLoginButton() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => loginScreen()));
  }



  dispose() {
    _passwordController.dispose();
    _confrimPasswordController.dispose();
    super.dispose();
  }
}
