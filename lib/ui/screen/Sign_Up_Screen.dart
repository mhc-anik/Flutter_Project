import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screen/login_screen.dart';
import 'package:task_manager/ui/widgets/Snack_Bar_Message.dart';
import 'package:task_manager/ui/widgets/screen_backGround.dart';

import '../../data/Services/Network_Caller.dart';
import '../../data/Utility/URLs.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _signUpInProgress = false;

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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //SizedBox(height: 100),
                      Text(
                        "Join With Us",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _emailController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(hintText: "Email"),
                        validator: (String? value) {
                          String inputTex = value ?? "";
                          if (EmailValidator.validate(inputTex) == false) {
                            return "Enter a Valid Email";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _firstNameController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(hintText: "First Name"),
                        validator: (String? value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Enter a First Name";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _lastNameController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(hintText: "Last Name"),
                        validator: (String? value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Enter a Last Name";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _mobileController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(hintText: "Mobile"),
                        validator: (String? value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Enter a Mobile Number";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _passwordController,
                        textInputAction: TextInputAction.next,
                        obscureText: true,
                        decoration: InputDecoration(hintText: "Password"),
                        validator: (String? value) {
                          if ((value?.length ?? 0) < 8) {
                            return "Enter a Password [Min 8 Digit]";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      Column(
                        children: [
                          Visibility(
                            visible: _signUpInProgress == false,
                            replacement: Center(
                              child: CircularProgressIndicator(),),
                            child: FilledButton(
                              onPressed: _onTabSubmitButton,
                              child: Icon(
                                Icons.arrow_circle_right_outlined,
                                size: 25,
                              ),
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
                                    ..onTap = _onTabLogInButton,
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

  void _onTabSubmitButton() {
    if (_formKey.currentState!.validate()) {
      _signUp();
    }
  }

  void _onTabLogInButton() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => loginScreen()));
  }

  Future<void> _signUp() async {
    _signUpInProgress = true;
    setState(() {});
    Map<String, dynamic> requestBody = {
      "email": _emailController.text.trim(),
      "password": _passwordController.text,
      "firstName": _firstNameController.text.trim(),
      "lastName": _lastNameController.text.trim(),
      "mobile": _mobileController.text.trim(),
    };
    final ApiResponse response = await ApiCaller.postRequest(
      url: Urls.registrationUrl,
      body: requestBody,
    );

    _signUpInProgress = false;
    setState(() {});

    if (response.isSuccess) {
      _clearTextFields();
      showSnackBarMessage(context, "Login Sucessfull");
    } else {
      showSnackBarMessage(context, response.errorMessage!);
    }
  }

  void _clearTextFields(){
    _emailController.clear();
    _passwordController.clear();
    _firstNameController.clear();
    _lastNameController.clear();
    _mobileController.clear();
  }


  dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _mobileController.dispose();
    super.dispose();
  }
}
